##
# Show the contents of the bitmap
class Clear
  def initialize(); end

  def execute(bitmap = nil)
    raise ArgumentError, 'Clear: Bitmap has not been created' if bitmap.nil?
    bitmap.clear
  end
end
