class WeatherController < ApplicationController
  def current
  	if params[:name]
  		@response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{params[:name]}&APPID=3ae18949940ecdb295e65ef1a2186a0f&units=metric")
  	end 
  end

  def forecast
  	if params[:name]
  	@response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=#{params[:name]}&appid=a8acf56360b2ba5ff1bd05d08a1e499c&units=metric")
 	end
 end
end
