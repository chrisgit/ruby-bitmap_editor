##
# Show the contents of the bitmap
class Show
  def initialize(); end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    puts bitmap.dump
  end
end
