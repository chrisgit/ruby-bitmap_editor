##
# Show the contents of the bitmap
class Colour
  def initialize(column, row, colour)
    @column = column.to_i
    @row = row.to_i
    @colour = colour.to_s
  end

  def execute(bitmap = nil)
    raise ArgumentError, 'Colour: Bitmap has not been created' if bitmap.nil?
    bitmap.colour_pixel(@column, @row, @colour)
  end
end
