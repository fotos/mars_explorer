require 'mars_explorer/version'

require 'mars_explorer/plateau'
require 'mars_explorer/rover'

module MarsExplorer
  class << self
    def run(io)
      plateau = create_plateau(io.gets.chomp!)

      until io.eof?
        rover = create_rover(plateau, io.gets.chomp!)
        instructions = parse_instructions(io.gets.chomp!)

        rover.follow_instructions!(instructions)

        puts rover
      end
    end

    private

    def create_plateau(line)
      x, y = line.split(' ')

      Plateau.new(x: Dimension.new(max: x), y: Dimension.new(max: y))
    end

    def create_rover(plateau, line)
      lng, lat, heading = line.split(' ')

      Rover.new(plateau: plateau, lng: lng, lat: lat, heading: heading)
    end

    def parse_instructions(line)
      line.split('')
    end
  end
end
