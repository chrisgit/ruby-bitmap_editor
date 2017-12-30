##
# Class to support unit tests
class BitmapTestHelper
  def self.create_and_fill(columns, rows, fill_colour)
    bitmap = Bitmap.new(columns, rows)
    bitmap.instance_variable_set(:@image, Array.new(columns * rows, fill_colour))
    bitmap
  end
end
