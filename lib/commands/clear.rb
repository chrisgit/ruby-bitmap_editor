##
# Show the contents of the bitmap
class Clear
  def initialize(); end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    bitmap.clear
  end
end
