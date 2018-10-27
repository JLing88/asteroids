class NasaService

  attr_reader :url

  def initialize
  end

  def get_asteroids(date_range)
    get_json("/neo/rest/v1/feed/?start_date=#{date_range.first}&end_date=#{date_range.last}&api_key=#{ENV["api_key"]}")
  end

  private
  
    def conn
      Faraday.new(url: "https://api.nasa.gov") do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)[:near_earth_objects]
    end
end