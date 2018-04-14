class NasaService

  def initialize
    @conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/")
  end

  def get_asteroids_within_dates(dates)
    asteroids = get_json("feed?start_date=#{dates[:start_date]}&end_date=#{dates[:end_date]}&api_key=#{ENV['NASA_API_KEY']}")
  end

  def get_favorites(user)
    favorites = user.favorites
    favorites.map do |favorite|
      attrs = get_json("neo/#{favorite.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
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

  def get_asteroid(user, id)
    favorite = user.favorites.find_by(neo_reference_id: id)
    attrs = get_json("neo/#{favorite.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
    a = Asteroid.new(attrs)
    { id: favorite.id,
      neo_reference_id: favorite.neo_reference_id,
      user_id: user.id,
      asteroid: {name: a.name,
        is_potentially_hazardous_asteroid: a.dangerous
      }
    }
  end

  private
    attr_reader :conn

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
