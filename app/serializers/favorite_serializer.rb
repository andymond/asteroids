class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :neo_reference_id, :asteroid

  def asteroid
    attrs = NasaService.new.get_asteroid(object.neo_reference_id)
    a = Asteroid.new(attrs)
    { name: a.name, is_potentially_hazardous_asteroid: a.dangerous }
  end

end
