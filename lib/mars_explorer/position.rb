class Position
  attr_accessor :lng, :lat

  def initialize(lng:, lat:)
    @lng = Integer(lng)
    @lat = Integer(lat)
  end

  def to_a
    [lng, lat]
  end

  def to_s
    "#{lng} #{lat}"
  end
end
