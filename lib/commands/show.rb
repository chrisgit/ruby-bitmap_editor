##
# Show the contents of the bitmap
class Show
  def initialize(); end

  def execute(bitmap = nil)
    return puts 'There is no image' if bitmap.nil?
    puts bitmap.dump
  end
end
