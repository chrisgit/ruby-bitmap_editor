require_relative 'bitmap'
require_relative 'commands/unknown'
require_relative 'commands/show'
require_relative 'commands/create'
require_relative 'commands/colour'
require_relative 'commands/clear'
require_relative 'commands/hline'
require_relative 'commands/vline'
##
# Bitmap editor, read editing instructions from file
class BitmapEditor
  def initialize()
    load_editor_commands
  end

  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)
    bitmap = nil

    File.open(file).each do |line|
      line = line.chomp.split
      edit_command = line[0]
      parameters = line[1..-1]
      klass = @commands.fetch(edit_command, Unknown)
      command = klass.new(*parameters)
      updated_bitmap = command.execute(bitmap)
      bitmap = updated_bitmap if updated_bitmap.is_a?(Bitmap)
    end
  end

  private

  def load_editor_commands
    @commands = {
      'S' => Show,
      'I' => Create,
      'C' => Clear,
      'L' => Colour,
      'H' => HorizontalLine,
      'V' => VerticalLine
    }
    @commands.default = Unknown
  end
end
