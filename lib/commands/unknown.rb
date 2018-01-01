##
# Unknown instruction
class Unknown
  def initialize(*_)
  end

  def execute(_ = nil)
    puts 'unrecognised command :('
  end
end
