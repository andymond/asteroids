class NasaService

  def initialize
    @conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/")
  end

  def get_asteroids_within_dates(dates)
    get_json("feed?start_date=#{dates[:start_date]}&end_date=#{dates[:end_date]}&api_key=#{ENV['NASA_API_KEY']}")
  end

  def get_asteroid(neo_reference_id)
    get_json("neo/#{neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
  end

  private
    attr_reader :conn

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
