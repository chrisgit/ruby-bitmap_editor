##
# Unknown instruction
class Unknown
  def initialize(*args)
  end

  def execute(_ = nil)
    puts 'unrecognised command :('
  end
end
