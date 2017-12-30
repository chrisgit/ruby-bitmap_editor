require_relative 'bitmap'
require_relative 'commands/unknown'
require_relative 'commands/show'
require_relative 'commands/create'
require_relative 'commands/colour'
require_relative 'commands/clear'
require_relative 'commands/hline'

##
# Bitmap editor, read editing instructions from file
class BitmapEditor
  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)
    @bitmap = nil

    File.open(file).each do |line|
      line = line.chomp.split
      command = line[0]
      parameters = line[1..-1]

      case command
      when 'S'
        command = Show.new(*parameters)
        command.execute(@bitmap)
      when 'I'
        command = Create.new(*parameters)
        @bitmap = command.execute(@bitmap)
      when 'L'
        command = Colour.new(*parameters)
        command.execute(@bitmap)
      when 'C'
        command = Clear.new(*parameters)
        command.execute(@bitmap)
      else
        command = Unknown.new(*parameters)
        command.execute(@bitmap)
      end
    end
  end
end
