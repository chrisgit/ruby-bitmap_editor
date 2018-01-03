# Class to represent a bitmap
class Bitmap
  attr_reader :range, :columns, :rows
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @range = Range.new(1, 1, columns, rows)
    @image = Array.new(columns * rows, 'O')
  end

  def clear
    @image.fill('O')
  end

  def draw(range, colour)
    raise RangeError, 'Bitmap: columns or rows out of bounds' unless @range.bounds?(range)
    colour_check(colour)
    # Also add a check for Colour
    range.start_row.upto(range.end_row) do |row|
      range.start_column.upto(range.end_column) do |column|
        set_pixel_colour(column, row, colour)
      end
    end
  end

  def colour_pixel(column, row, colour)
    column_range_check(column, column)
    row_range_check(row, row)
    colour_check(colour)
    set_pixel_colour(column, row, colour)
  end

  def draw_horizontal(start_column, end_column, row, colour)
    start_column, end_column = end_column, start_column if start_column > end_column
    column_range_check(start_column, end_column)
    row_range_check(row, row)
    colour_check(colour)
    dhorizontal(start_column, end_column, row, colour)
  end

  def draw_vertical(column, start_row, end_row, colour)
    start_row, end_row = end_row, start_row if start_row > end_row
    column_range_check(column, column)
    row_range_check(start_row, end_row)
    colour_check(colour)
    dvertical(column, start_row, end_row, colour)
  end

  def dump
    @image.each_slice(@columns).map(&:join)
  end

  private

  def column_range_check(start_column, end_column)
    return if start_column > 0 && end_column <= @columns
    raise RangeError, 'Bitmap: Column is out of range'
  end

  def row_range_check(start_row, end_row)
    return if start_row > 0 && end_row <= @rows
    raise RangeError, 'Bitmap: Row is out of range'
  end

  def colour_check(colour)
    pixel_colour = PixelColour.new(colour)
    raise ArgumentError, 'Colour: The specified colour is not valid' unless pixel_colour.valid?
  end

  def set_pixel_colour(column, row, colour)
    row_offset = (row - 1) * @columns
    @image[row_offset + column - 1] = colour
  end

  def dhorizontal(start_column, end_column, row, colour)
    start_column.upto(end_column) do |column|
      set_pixel_colour(column, row, colour)
    end
  end

  def dvertical(column, start_row, end_row, colour)
    start_row.upto(end_row) do |row|
      set_pixel_colour(column, row, colour)
    end
  end
end
