class NrelService < ApiService
  def self.get_station(origin_point)
    stations = get_data("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{origin_point}&fuel_type=ELEC&limit=1")
    stations[:fuel_stations].first
  end
end