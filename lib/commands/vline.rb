##
# Draw a vertical line in the bitmap
class VerticalLine
  attr_reader :range, :colour
  def initialize(column, start_row, end_row, colour)
    @colour = colour.to_s
    @range = BitmapRange.new(column.to_i, start_row.to_i, column.to_i, end_row.to_i)
  end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    bitmap.draw(@range, @colour)
  end
end
