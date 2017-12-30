##
# Draw a vertical line in the bitmap
class VerticalLine
  attr_reader :column, :start_row, :end_row, :colour
  def initialize(column, start_row, end_row, colour)
    @column = column.to_i
    @start_row = start_row.to_i
    @end_row = end_row.to_i
    @colour = colour.to_s
    @start_row, @end_row = @end_row, @start_row if @start_row > @end_row
  end

  def execute(bitmap = nil)
    raise ArgumentError, 'Vertical Line: Bitmap has not been created' if bitmap.nil?
  end
end
