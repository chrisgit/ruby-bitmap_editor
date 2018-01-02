##
# class to store colour
class PixelColour
  attr_reader :colour
  def initialize(colour)
    @colour = colour
  end

  def valid?
    return false if colour.length != 1
    ('A'..'Z').cover? colour
  end
end
