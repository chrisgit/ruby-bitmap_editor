##
# Draw a horizontal line in the bitmap
class HorizontalLine
  attr_reader :range, :colour

  def initialize(start_column, end_column, row, colour)
    @colour = colour.to_s
    start_column = start_column.to_i
    end_column = end_column.to_i
    row = row.to_i
    @range = BitmapRange.new(start_column, row, end_column, row)
  end

  def execute(bitmap)
    bitmap.draw(@range, @colour)
  end
end
