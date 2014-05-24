#! /usr/bin/env ruby
at_exit { `reset` }

require 'io/console'
require 'yaml'

Thread.abort_on_exception = true
READSIZE = 1024
DELAY = 0.5

class SlideAdvancer

  def initialize(writer, slides)
    @writer = writer
    @slides = slides
    @queue_out, @queue_in  = IO.pipe
    Thread.new { work_the_queue }
  end

  def start
    init_signal_handler
    sleep
  end

  private

  def work_the_queue
    loop {
      @queue_out.readpartial(READSIZE)
      Array(current_command_set).each do |c|
        sleep DELAY
        @writer.write c
      end
    }
  end

  def init_signal_handler
    Signal.trap("USR1") { advance }
  end

  def advance
    @queue_in << "Advance"
  end

  def current_command_set
    @slides.shift or exit
  end

end

class Presentation

  def initialize(slide_file)
    @slides = YAML.load_file(slide_file)
  end

  def start
    spawn_application do |writer|
      SlideAdvancer.new(writer, @slides).start
    end
  end

  private

  def spawn_application
    PTY.spawn("bash") do |r, w, pid|
      r.winsize = STDOUT.winsize
      w.puts "clear"
      draw_screen_from(r)
      yield w
    end
  end

  def draw_screen_from(reader)
    Thread.new do
      loop { STDOUT.write reader.readpartial(READSIZE) }
    end
  end

end

command = "kill -s USR1 #{Process.pid}"
puts "Send `#{command}` to advance the slide.";
IO.popen("pbcopy", "w"){|pbcopy| pbcopy << command }
STDIN.getc

Presentation.new(ARGV[0]).start
