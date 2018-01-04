require_relative 'bitmap'
require_relative 'nilbitmap'
require_relative 'pixelcolour'
require_relative 'bitmaprange'
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
      updated_bitmap = run_command(line, bitmap)
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

  def run_command(line, bitmap)
    line = line.chomp.split
    command = fetch_command(line[0], line[1..-1])
    command.execute(bitmap)
  end

  def fetch_command(command, parameters)
    klass = @commands.fetch(command, Unknown)
    klass.new(*parameters)
  end
end
