class MostDangerousDayPresenter
  attr_reader :start_date, :end_date

  def initialize(dates)
    @start_date = Time.parse(dates[:start_date]).strftime("%B %-d, %Y")
    @end_date   = Time.parse(dates[:end_date]).strftime("%B %-d, %Y")
    @asteroids  = Asteroid.get_asteroids(dates)
    @parser     = DangerousDayParser.new(@asteroids)
  end

  def most_dangerous_day
    Time.new(@parser.most_dangerous_day[0].to_s).strftime("%B %d, %Y")
  end

  def mdd_asteroid_count
    @parser.most_dangerous_day[1]
  end

  def dangerous_asteroids
    @parser.dangerous_asteroids
  end

end
