class DangerousDayParser

  def initialize(results)
    @dates = results[:near_earth_objects]
  end

  def dates_with_passing_asteroids
    @dates.map do |date, asteroids|
      [date, asteroids.map { |asteroid| [asteroid[:is_potentially_hazardous_asteroid], asteroid[:name], asteroid[:neo_reference_id]]
        }]
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
    date_count = dates_with_hazardous_counts.max_by do |date, count|
      count
    end
  end

  def dangerous_day_details
    dates_with_passing_asteroids[most_dangerous_day[0]].select do |a|
      a[0] == true
    end
  end

  def dangerous_asteroids
    dangerous_day_details.map do |attrs|
      Asteroid.new(attrs)
    end
  end

end
