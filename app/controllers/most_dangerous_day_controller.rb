class MostDangerousDayController < ApplicationController
  def index
    response = Faraday.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=#{params[:start_date]}&end_date=#{params[:end_date]}&api_key=#{ENV['NASA_API_KEY']}")
    results = JSON.parse(response.body)
    
  end
end
