class Asteroid
  attr_reader :dangerous, :name, :neo_id

  def initialize(attrs)
    @dangerous = attrs[0]
    @name      = attrs[1]
    @neo_id    = attrs[2]
  end
end
