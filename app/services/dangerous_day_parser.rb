class DangerousDayParser

  def initialize(asteroids)
    @dates = asteroids[:near_earth_objects]
  end

  def dates_with_passing_asteroids
    @dates.map do |date, asteroids|
      [date, asteroids.map { |asteroid| Asteroid.new(asteroid) }]
    end.to_h
  end

  def dates_with_hazardous_asteroids
    @dates.map do |date, asteroids|
      [date, asteroids.map { |asteroid| asteroid[:is_potentially_hazardous_asteroid]}]
    end.to_h
  end

  def dates_with_hazardous_counts
    dates_with_hazardous_asteroids.map do |date, hazardous|
      [date, hazardous.count(true)]
    end.to_h
  end

  def most_dangerous_day
    dates_with_hazardous_counts.max_by do |date, count|
      count
    end
  end

  def dangerous_asteroids
    dates_with_passing_asteroids[most_dangerous_day[0]].select do |a|
      a.dangerous == true
    end
  end
end
