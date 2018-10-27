class MostDangerousDayController < ApplicationController
  def index
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    @asteroids = AsteroidFacade.new([start_date, end_date])
    binding.pry
    # @date_range = [start_date.strftime("%B %e, %Y"), end_date.strftime("%B%e %Y")]
 
    # conn = Faraday.new(url: "https://api.nasa.gov") do |faraday|
    #   faraday.adapter Faraday.default_adapter
    # end

    # response = conn.get("/neo/rest/v1/feed/?start_date=#{start_date}&end_date=#{end_date}&api_key=#{ENV["api_key"]}")
    # results = JSON.parse(response.body, symbolize_names: true)[:near_earth_objects]

    # @asteroids = results.map do |date|
    #   date.second.map do |asteroid_data|
    #     if asteroid_data[:is_potentially_hazardous_asteroid] == true
    #       Asteroid.new(asteroid_data)
    #     end
    #   end
    # end
  end
end
