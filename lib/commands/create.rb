##
# Create a new bitmap
class Create
  def initialize(columns, rows)
    @columns = columns.to_i
    @rows = rows.to_i
    raise ArgumentError, 'Create: Columns outside of range (1..250)' if @columns < 1 || @columns > 250
    raise ArgumentError, 'Create: Rows outside of range (1..250)' if @rows < 1 || @rows > 250
  end

  def execute(_ = nil)
    Bitmap.new(@columns, @rows)
  end
end
