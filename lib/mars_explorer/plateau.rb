require_relative 'dimension'

class Plateau
  attr_reader :x, :y

  def initialize(x:, y:)
    raise ArgumentError.new('Invalid plateau dimensions') if x.length < 1 || y.length < 1
    raise ArgumentError.new('Invalid non-square plateau') if x.length != y.length

    @x = x
    @y = y
  end
end
