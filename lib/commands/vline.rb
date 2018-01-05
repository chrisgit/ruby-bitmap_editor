##
# Draw a vertical line in the bitmap
class VerticalLine
  attr_reader :range, :colour
  def initialize(column, start_row, end_row, colour)
    @colour = colour.to_s
    column = column.to_i
    start_row = start_row.to_i
    end_row = end_row.to_i
    @range = BitmapRange.new(column, start_row, column, end_row)
  end

  def execute(bitmap)
    bitmap.draw(@range, @colour)
  end
end
