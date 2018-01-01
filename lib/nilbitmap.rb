##
# Class to represent an empty bitmap
class NilBitmap
  attr_reader :rows, :columns
  def initialize()
    @columns = 0
    @rows = 0
    @image = []
  end

  def clear
    raise ArgumentError, 'Clear: Bitmap has not been created'
  end

  def colour_pixel(_, _, _)
    raise ArgumentError, 'Colour: Bitmap has not been created'
  end

  def dump
    'There is no image'
  end
end
