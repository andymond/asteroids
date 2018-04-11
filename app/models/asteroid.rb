class Asteroid
  attr_reader :dangerous, :name, :neo_id, :api_name, :api_dangerous

  def initialize(attrs)
    binding.pry
    @dangerous     = attrs[0]
    @name          = attrs[1]
    @neo_id        = attrs[2]
    @api_name      = attrs[:name]
    @api_dangerous = attrs[:is_potentially_hazardous_asteroid]
  end
end
