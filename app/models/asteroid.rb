class Asteroid
  attr_reader :date,
              :name,
              :ref_id
              
  def initialize(attributes = {})
    @name = attributes[:name]
    @ref_id = attributes[:neo_reference_id]
    @hazardous = attributes[:is_potentially_hazardous_asteroid]
    @date = attributes[:close_approach_data].first[:close_approach_date]
  end  
end
