class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    @pois = Poi.where.not(latitude: nil, longitude: nil).limit(6)

    @hash = Gmaps4rails.build_markers(@pois) do |poi, marker|
      marker.lat poi.latitude
      marker.lng poi.longitude
    end

  end
end
