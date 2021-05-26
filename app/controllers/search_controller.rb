class SearchController < ApplicationController
  def index
    # Input validation / type checking 

    origin_point = params[:location]
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{origin_point}&fuel_type=ELEC&limit=1")
    json = JSON.parse(response.body, symbolize_names: true)
    
    directions_response = Faraday.get({origin_point: origin_point, lat:json[:latitude], lng:json[:longitude]})
    binding.pry
  end
end
