##
# Show the contents of the bitmap
class Colour
  attr_reader :range, :colour

  def initialize(column, row, colour)
    @colour = colour.to_s
    @range = BitmapRange.new(column.to_i, row.to_i, column.to_i, row.to_i)
  end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    bitmap.draw(@range, @colour)
  end
end
