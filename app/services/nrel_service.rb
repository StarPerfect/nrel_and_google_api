class NrelService < ApiService
  def self.get_stations(args)
    stations = get_data("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=#{origin_point}&fuel_type=ELEC&limit=1")
  end
end