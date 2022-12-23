class MuseumsController < ApplicationController
  def index
  end

  def search
    @museums = find_museums(params[:lat], params[:long])
  end

  private

  def find_museums(lat, long)
    HTTParty.get("https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?type=poi&proximity=#{long},#{lat}&access_token=pk.eyJ1IjoidG9ta2l0c29uIiwiYSI6ImNsYXY4dWoybjAyMTUzcHA0dHByNDRhdWoifQ.77Cl2WGYYhUMhb_YAyFnbQ")
  end

  # def museum_params
  #   params.require(:museum).permit(:lat, :long)
  # end
end
