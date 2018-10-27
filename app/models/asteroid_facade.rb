class AsteroidFacade

  attr_reader :date_range

  def initialize(date_range)
    @date_range = date_range
  end

  def most_dangerous_day
    dangerous_asteroids.group_by do |asteroid|
      asteroid.date
    end
  end

  private

  def asteroid_service
    NasaService.new
  end

  def dangerous_asteroids
    asteroid_service.get_asteroids(@date_range).map do |date|
      date.second.map do |asteroid_data|
        if asteroid_data[:is_potentially_hazardous_asteroid] == true
          Asteroid.new(asteroid_data)
        end
      end
    end.flatten.compact
  end

end