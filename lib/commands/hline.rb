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

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    raise ArgumentError, 'HorizontalLine: Bitmap has not been created' if bitmap.is_a? NilBitmap
    raise RangeError, 'Horizontal Line: Start Column is out of range' if @start_column < 1 || @start_column > bitmap.columns
    raise RangeError, 'Horizontal Line: End Column is out of range' if @end_column < 1 || @end_column > bitmap.columns
    @start_column.upto(@end_column) do |column|
      bitmap.colour_pixel(column, @row, @colour)
    end
  end
end
