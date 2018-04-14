class MostDangerousDayController < ApplicationController
  def index
    ns = NasaService.new
    results = ns.get_asteroids_within_dates(params)
    parser = DangerousDayParser.new(results)
    @start_date = Time.parse(params[:start_date]).strftime("%B %-d, %Y")
    @end_date = Time.parse(params[:end_date]).strftime("%B %-d, %Y")
    @most_dangerous_day = parser.most_dangerous_day
    @details = parser.dangerous_asteroids
  end
end
