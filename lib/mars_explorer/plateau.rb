require_relative 'dimension'
require_relative 'position'

class Plateau
  attr_reader :x, :y

  def initialize(x:, y:)
    raise ArgumentError.new('Invalid plateau dimensions') if x.length < 1 || y.length < 1
    raise ArgumentError.new('Invalid non-square plateau') if x.length != y.length

    @x = x
    @y = y
  end

  def include?(position)
    position.lng.between?(x.min, x.max) &&
      position.lat.between?(y.min, y.max)
  end
end
