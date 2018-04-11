class MostDangerousDayController < ApplicationController
  def index
    response = Faraday.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=#{params[:start_date]}&end_date=#{params[:end_date]}&api_key=#{ENV['NASA_API_KEY']}")
    results = JSON.parse(response.body, symbolize_names: true)
    parser = DangerousDayParser.new(results)
    @start_date = Time.parse(params[:start_date]).strftime("%B %-d, %Y")
    @end_date = Time.parse(params[:end_date]).strftime("%B %-d, %Y")
    @most_dangerous_day = parser.most_dangerous_day
    @details = parser.dangerous_asteroids
  end
end
