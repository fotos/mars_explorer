class Compass
  CARDINAL_POINTS = %w[N E S W].freeze

  attr_accessor :heading

  def initialize(heading:)
    raise ArgumentError.new("Invalid heading: #{heading}") unless CARDINAL_POINTS.include?(heading)

    @heading = heading
  end

  def left
    turn(:left)
  end

  def right
    turn(:right)
  end

  private

  def turn(direction)
    direction = direction == :left ? -1 : 1

    self.heading = CARDINAL_POINTS[(CARDINAL_POINTS.index(heading) + direction) % CARDINAL_POINTS.size]
  end
end
