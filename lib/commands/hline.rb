##
# Draw a horizontal line in the bitmap
class HorizontalLine
  attr_reader :start_column, :end_column, :row, :colour

  def initialize(start_column, end_column, row, colour)
    @start_column = start_column.to_i
    @end_column = end_column.to_i
    @row = row.to_i
    @colour = colour.to_s
  end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    bitmap.draw_horizontal(@start_column, @end_column, @row, @colour)
  end
end
