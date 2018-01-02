##
# Draw a vertical line in the bitmap
class VerticalLine
  attr_reader :column, :start_row, :end_row, :colour
  def initialize(column, start_row, end_row, colour)
    @column = column.to_i
    @start_row = start_row.to_i
    @end_row = end_row.to_i
    @colour = colour.to_s
  end

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    bitmap.draw_vertical(@column, @start_row, @end_row, @colour)
  end
end
