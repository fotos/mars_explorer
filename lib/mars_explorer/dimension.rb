class Dimension
  attr_reader :min, :max

  def initialize(min: 0, max: 0)
    @min = Integer(min)
    @max = Integer(max)

    raise ArgumentError if @min > @max
  end

  def length
    max - min
  end
end
