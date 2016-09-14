class Tile
  attr_reader :given, :value

  def initialize(given, value = "_")
    @given = given
    @value = value
  end

  def display
    "#{@value}"
  end

  def set_value(value)
    if @given
      raise "Cant change a given value"
    else
      @value = value
    end
  end
end
