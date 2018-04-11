class NasaNeoService

  def initialize
    @conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/")
  end

  def get_favorites(user)
    favorites = user.favorites
    favorites.map do |favorite|
      attrs = get_json("#{favorite.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
      a = Asteroid.new(attrs)
      { id: favorite.id,
        neo_reference_id: favorite.neo_reference_id,
        user_id: user.id,
        asteroid: {name: a.name,
          is_potentially_hazardous_asteroid: a.dangerous
        }
      }
    end
  end

  private
    attr_reader :conn

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
