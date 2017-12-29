require_relative 'bitmap'
require_relative 'commands/unknown'
require_relative 'commands/show'
require_relative 'commands/create'

##
# Bitmap editor, read editing instructions from file
class BitmapEditor
  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)

    File.open(file).each do |line|
      line = line.chomp.split
      command = line[0]
      parameters = line[1..-1]

      case command
      when 'S'
        command = Show.new(*parameters)
        command.execute
      else
        command = Unknown.new(*parameters)
        command.execute
      end
    end
  end
end
