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

  def execute(bitmap = NilBitmap.new)
    bitmap ||= NilBitmap.new
    raise ArgumentError, 'VerticalLine: Bitmap has not been created' if bitmap.is_a? NilBitmap
    range_check(bitmap.rows)
    draw_vertical(bitmap)
  end

  private

  def range_check(bitmap_rows)
    raise RangeError, 'Vertical Line: Start Row is out of range' if @start_row < 1 || @start_row > bitmap_rows
    raise RangeError, 'Vertical Line: End Row is out of range' if @end_row < 1 || @end_row > bitmap_rows
  end

  def draw_vertical(bitmap)
    @start_row.upto(@end_row) do |row|
      bitmap.colour_pixel(@column, row, @colour)
    end
  end
end
