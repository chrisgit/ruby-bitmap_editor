# Class to represent a bitmap
class Bitmap
  attr_reader :rows, :columns
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @image = Array.new(columns * rows, 'O')
  end

  def clear
    @image.fill('O')
  end

  def colour_pixel(column, row, colour)
    column_range_check(column, column)
    row_range_check(row, row)
    raise ArgumentError, 'Colour: The specified colour is not valid' unless valid_colour?(colour)
    set_pixel_colour(column, row, colour)
  end

  def draw_horizontal(start_column, end_column, row, colour)
    start_column, end_column = end_column, start_column if start_column > end_column
    column_range_check(start_column, end_column)
    row_range_check(row, row)

    start_column.upto(end_column) do |column|
      set_pixel_colour(column, row, colour)
    end
  end

  def draw_vertical(column, start_row, end_row, colour)
    start_row, end_row = end_row, start_row if start_row > end_row
    column_range_check(column, column)
    row_range_check(start_row, end_row)

    start_row.upto(end_row) do |row|
      set_pixel_colour(column, row, colour)
    end
  end

  def dump
    @image.each_slice(@columns).map(&:join)
  end

  private

  def valid_colour?(colour)
    return false if colour.length != 1
    ('A'..'Z').cover? colour
  end

  def column_range_check(start_column, end_column)
    return if start_column > 0 && end_column <= @columns
    raise RangeError, 'Bitmap: Column is out of range'
  end

  def row_range_check(start_row, end_row)
    return if start_row > 0 && end_row <= @rows
    raise RangeError, 'Bitmap: Row is out of range'
  end

  def set_pixel_colour(column, row, colour)
    row_offset = (row - 1) * @columns
    @image[row_offset + column - 1] = colour
  end    
end
