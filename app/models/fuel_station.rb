class FuelStation
  def initialize(data = {})
    @name = data["fuel_stations"][0]["station_name"]
    @street = data["fuel_stations"][0]["street_address"]
    @city = data["fuel_stations"][0]["city"]
    @state = data["fuel_stations"][0]["state"]
    @zip = data["fuel_stations"][0]["zip"]
    @fuel_type = data["fuel_stations"][0]["fuel_type_code"]
    @access_times = data["fuel_stations"][0]["access_days_times"]
  end
end
