##
# Class to store a range of pixels
class BitmapRange
  attr_reader :start_column, :end_column, :start_row, :end_row

  def initialize(start_column, start_row, end_column, end_row)
    start_column, end_column = end_column, start_column if start_column > end_column
    start_row, end_row = end_row, start_row if start_row > end_row
    @start_column = start_column
    @end_column = end_column
    @start_row = start_row
    @end_row = end_row
  end

  def bounds?(other)
    return false if other.nil?
    return false unless other.is_a? BitmapRange
    return false if other.start_column < @start_column || other.end_column > @end_column
    return false if other.start_row < @start_row || other.end_row > @end_row
    true
  end

  def to_s
    "#{@start_column},#{start_row} - #{@end_column},#{end_row}"
  end
end
