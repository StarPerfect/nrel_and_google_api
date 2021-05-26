class SearchController < ApplicationController
  def index
    # Input validation / type checking 
    
    origin_point = location_params[:location]
    station_result = NrelService.get_stations(origin_point)
    direction_result = GoogleService.get_directions.get({origin_point: origin_point, 
                                                            lat: station_result[:latitude], 
                                                            lng: station_result[:longitude]})
    binding.pry
  end

  private

  def location_params
    params.permit(:location)
  end
end
