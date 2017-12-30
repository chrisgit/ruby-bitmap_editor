##
# Draw a horizontal line in the bitmap
class HorizontalLine
  attr_reader :start_column, :end_column, :row, :colour

  def initialize(start_column, end_column, row, colour)
    @start_column = start_column.to_i
    @end_column = end_column.to_i
    @row = row.to_i
    @colour = colour.to_s
    @start_column, @end_column = @end_column, @start_column if @start_column > @end_column
  end

  def execute(bitmap = nil)
    raise ArgumentError, 'HorizontalLine: Bitmap has not been created' if bitmap.nil?
  end
end
