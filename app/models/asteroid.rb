class Asteroid
  attr_reader :dangerous, :name, :neo_id, :api_name, :api_dangerous

  def initialize(attrs)
    @dangerous     = attrs[:is_potentially_hazardous_asteroid]
    @name          = attrs[:name]
    @neo_id        = attrs[:neo_reference_id]
  end
end
