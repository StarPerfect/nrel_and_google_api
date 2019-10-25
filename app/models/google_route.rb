class GoogleRoute
  attr_reader :distance, :duration, :directions
  def initialize(data = {})
    @distance = data["routes"][0]["legs"][0]["distance"]["text"]
    @duration = data["routes"][0]["legs"][0]["duration"]["text"]
    @directions_array = data["routes"][0]["legs"][0]["steps"]
  end

  def directions
    directions_array = []
    @directions_array.map do |instruction|
      directions_array << instruction["html_instructions"]
    end
    directions_array
  end
end
