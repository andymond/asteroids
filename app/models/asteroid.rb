class Asteroid
  attr_reader :dangerous, :name, :neo_id, :api_name, :api_dangerous

  def initialize(attrs)
    @dangerous     = attrs[:is_potentially_hazardous_asteroid]
    @name          = attrs[:name]
    @neo_id        = attrs[:neo_reference_id]
  end

  def self.get_asteroids(dates)
    ns = NasaService.new
    ns.get_asteroids_within_dates(dates)
  end

end
