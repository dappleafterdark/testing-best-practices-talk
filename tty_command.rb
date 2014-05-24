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
  end

  def start
    init_signal_handler
    sleep
  end

  private

  def init_signal_handler
    Signal.trap("USR1") { advance }
  end

  def advance
    Array(current_command_set).each do |c|
      sleep DELAY
      @writer.puts c
    end
  end

  def current_command_set
    @slides.shift or exit
  end

end

class Presentation

  def initialize(slide_file)
    slides = YAML.load_file(slide_file)
    spawn_application do |writer|
      SlideAdvancer.new(writer, slides).start
    end
  end

  private

  def spawn_application
    PTY.spawn("bash") do |r, w, pid|
      r.winsize = STDOUT.winsize
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

puts "Send `kill -s USR1 #{Process.pid}` to advance the slide."
Presentation.new(ARGV[0])
