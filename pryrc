# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

# Shortcuts
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

module ToHashRecursive
  module_function
  def call(obj)
    case
    when obj.nil?
      nil
    when Array === obj
      obj.map{|item| ToHashRecursive.call(item) }
    when obj.respond_to?(:to_h)
      obj.to_h.map{|k, v| [k, ToHashRecursive.call(v)]}.to_h
    else
      obj
    end
  end
end

# Use awesome print by default
begin
  require "awesome_print"
  AwesomePrint.pry!
rescue LoadError
  puts "Could not load awesome_print"
end
