class GoogleService < ApiService
  def self.get_directions(args)
    directions = get_data("https://maps.googleapis.com/maps/api/directions/json?origin=#{args[:origin_point]}&destination=#{args[:lat]},#{args[:lng]}&key=#{ENV['GOOGLE_API_KEY']}")
  end
end