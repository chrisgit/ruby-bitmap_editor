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
end
