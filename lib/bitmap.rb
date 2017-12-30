# Class to represent a bitmap
class Bitmap
  attr_reader :rows, :columns
  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @image = Array.new(columns * rows, 'O')
  end

  def dump
    @image.each_slice(@columns).map(&:join)
  end

  def colour_pixel(column, row, colour)
    raise RangeError, 'Bitmap: Column is out of range' if column < 1 || column > @columns
    raise RangeError, 'Bitmap: Row is out of range' if row < 1 || row > @rows
    raise ArgumentError, 'Colour: The specified colour is not valid' unless valid_colour?(colour)
  end

  private

  def valid_colour?(colour)
    return false if colour.length != 1
    ('A'..'Z').cover? colour
  end
end
