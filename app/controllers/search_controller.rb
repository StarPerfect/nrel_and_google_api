class SearchController < ApplicationController
  def index
    # Input validation / type checking 
    
    origin_point = location_params[:location]
    station_result = NrelService.get_station(origin_point)
    direction_result = GoogleService.get_directions({origin_point: origin_point, 
                                                            lat: station_result[:latitude], 
                                                            lng: station_result[:longitude]})
    @result = Station.new(station_result[:station_name], 
                          station_result[:street_address], 
                          station_result[:city],
                          station_result[:state],
                          station_result[:zip],
                          station_result[:fuel_type_code],
                          station_result[:access_days_time])
    @route = Distance.new(direction_result[:distance], direction_result[:duration][:text], direction_result[:steps])                 
  end

  private

  def location_params
    params.permit(:location)
  end
end
