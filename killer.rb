require "io/console"

$debug = false

pid = ARGV.shift.to_i
puts "pid => #{pid.inspect}" if $debug

def wait_for_keystroke stream
  char = stream.getch
  puts "char => #{char.inspect}" if $debug
  exit if char == "\u0003" # Ctrl-C

  extra = stream.read_nonblock(1024)
  puts "read_nonblock => #{extra.inspect}" if $debug
rescue Errno::EAGAIN
  # read_nonblock raises when there is nothing to read.
end

while true
  puts "waiting for input" if $debug
  wait_for_keystroke $stdin

  puts "killing" if $debug
  Process.kill "USR1", pid
end
