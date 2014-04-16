# Need: gem install colorize
require 'colorize'

# Debug messages print
def log(message)
    puts "LOG:".colorize(:red)+" #{message}".colorize(:green)
end