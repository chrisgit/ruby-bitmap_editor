require_relative 'bitmap'
require_relative 'nilbitmap'
require_relative 'command'
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
    bitmap = NilBitmap.new

    File.open(file).each do |line|
      instruction = Command.new(line)
      klass = @commands.fetch(instruction.command, Unknown)
      command = klass.new(*instruction.parameters)
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
