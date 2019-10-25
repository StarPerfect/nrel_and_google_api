class SearchController < ApplicationController
  def index
    conn = Faraday.new(
    url: 'https://developer.nrel.gov/',
    params: { fuel_type: 'ELEC',
              location: location_params,
              limit: 1,
              api_key: ENV['NREL_API_KEY'],
              format: 'JSON'}
    )

    raw_response = conn.get('/api/alt-fuel-stations/v1/nearest.json')

    parsed = JSON.parse(raw_response.body, sybmolize_names: true)

    fuel_station = FuelStation.new(parsed)

    @result = FuelStation.new(parsed)
  end

  private

  def location_params
    params.permit(:location)
  end
end
