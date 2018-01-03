##
# Draw a horizontal line in the bitmap
class HorizontalLine
  attr_reader :range, :colour

  def initialize(start_column, end_column, row, colour)
    @colour = colour.to_s
    @range = BitmapRange.new(start_column.to_i, row.to_i, end_column.to_i, row.to_i)
  end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    bitmap.draw(@range, @colour)
  end
end
