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

    @result = FuelStation.new(parsed)

    google_conn = Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/',
      params: { key: ENV['GOOGLE_API_KEY'],
                origin: location_params,
                destination: "#{@result.street}, #{@result.city}, #{@result.state} #{@result.zip}"
      })

    google_response = google_conn.get('directions/json')

    google_parsed = JSON.parse(google_response.body, sybmolize_names: true)

    @route = GoogleRoute.new(google_parsed)

  end

  private

  def location_params
    params.permit(:location)
  end
end
