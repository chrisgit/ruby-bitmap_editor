require_relative 'commands/unknown'

##
# Bitmap editor, read editing instructions from file
class BitmapEditor
  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exist?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
        puts 'There is no image'
      else
        command = Unknown.new
        command.execute
      end
    end
  end
end
