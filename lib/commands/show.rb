##
# Show the contents of the bitmap
class Show
  def initialize(); end

  def execute(bitmap = NilBitmap.new)
    bitmap = NilBitmap.new if bitmap.nil?
    puts bitmap.dump
  end
end
