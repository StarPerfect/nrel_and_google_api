class SearchController < ApplicationController
  def index
    conn = Faraday.new(
    url: 'https://developer.nrel.gov/',
    params: { fuel_type: 'ELEC',
              location: '1331 17th St LL100, Denver, CO 80202',
              limit: 1,
              api_key: ENV['NREL_API_KEY'],
              format: 'JSON'}
    )

    raw_response = conn.get('/api/alt-fuel-stations/v1/nearest.json')

    parsed = JSON.parse(raw_response.body, sybmolize_names: true)
    binding.pry
  end
end
