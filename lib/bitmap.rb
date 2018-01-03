# Class to represent a bitmap
class Bitmap
  attr_reader :range, :columns, :rows
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @range = BitmapRange.new(1, 1, columns, rows)
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

  def dump
    @image.each_slice(@columns).map(&:join)
  end

  private

  def colour_check(colour)
    pixel_colour = PixelColour.new(colour)
    raise ArgumentError, 'Colour: The specified colour is not valid' unless pixel_colour.valid?
  end

  def set_pixel_colour(column, row, colour)
    row_offset = (row - 1) * @columns
    @image[row_offset + column - 1] = colour
  end
end
