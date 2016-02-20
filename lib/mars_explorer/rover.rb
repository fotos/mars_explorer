require_relative 'position'
require_relative 'compass'

class Rover
  class Error < StandardError; end
  class OutOfBoundsError < Error; end

  VALID_INSTRUCTIONS = %w[L R M].freeze

  def initialize(plateau:, lng:, lat:, heading:)
    @position = Position.new(lng: lng, lat: lat)

    invalid_position!(@position) unless plateau.include?(@position)

    @compass = Compass.new(heading: heading)
    @plateau = plateau
  end

  def lng
    position.lng
  end

  def lat
    position.lat
  end

  def heading
    compass.heading
  end

  def turn_left
    compass.left
  end

  def turn_right
    compass.right
  end

  def move!
    new_position = calculate_position

    move?(new_position) ? move(new_position) : invalid_position!(new_position)
  end

  def follow_instructions!(instructions)
    validate_instructions!(instructions)

    instructions.each do |instruction|
      case instruction
      when 'L'
        turn_left
      when 'R'
        turn_right
      when 'M'
        move!
      end
    end
  end

  def to_a
    [lng, lat, heading]
  end

  def to_s
    to_a.join(' ')
  end

  private

  attr_accessor :position
  attr_reader :compass, :plateau

  def validate_instructions!(instructions)
    instructions.each_with_index do |instruction, index|
      unless VALID_INSTRUCTIONS.include?(instruction)
        error = instructions.insert(index, '>').insert(index + 2, '<').join(' ')
        raise ArgumentError.new("Invalid instruction: #{error}")
      end
    end
  end

  def move?(position)
    plateau.include?(position)
  end

  def move(position)
    self.position = position
  end

  def calculate_position
    position.dup.tap do |p|
      case heading
      when 'N'
        p.lat += 1
      when 'E'
        p.lng += 1
      when 'S'
        p.lat -= 1
      when 'W'
        p.lng -= 1
      end
    end
  end

  def invalid_position!(position)
    raise OutOfBoundsError.new("Invalid position outside the plateau: #{position}")
  end
end
