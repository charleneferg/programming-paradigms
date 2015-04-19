
require 'singleton'

class SimpleLogger
  include Singleton

  def initialize
    @output = []
    puts "hello"
  end

  attr_reader :output

  def error(message)
    output << formatted_message(message, "ERROR")
  end

  def info(message)
    output << formatted_message(message, "INFO")
  end

  def write(filename)
    File.open(filename, "a") { |f| f << output.join }
  end

  private

  def formatted_message(message, message_type)
    "#{Time.now} | #{message_type}: #{message}\n"
  end
end

c = SimpleLogger.instance

puts "test"