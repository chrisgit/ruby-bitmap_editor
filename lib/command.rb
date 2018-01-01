##
# class to store the parsed commands
class Command
  attr_reader :command, :parameters
  def initialize(instruction)
    instruction_parts = instruction.chomp.split
    @command = instruction_parts[0]
    @parameters = instruction_parts[1..-1]
  end
end
