class ApplicationController < ActionController::Base
  Station = Struct.new(:name,:street, :city,:state,:zip,:fuel_type,:access_times)
  Distance = Struct.new(:distance, :duration, :directions)
end
