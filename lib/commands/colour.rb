##
# Show the contents of the bitmap
class Colour
  attr_reader :range, :colour

  def initialize(column, row, colour)
    @colour = colour.to_s
    column = column.to_i
    row = row.to_i
    @range = BitmapRange.new(column, row, column, row)
  end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    bitmap.draw(@range, @colour)
  end
end
