class PoisController < ApplicationController

  before_action :find_poi, only: [ :show ]

  def index
    @pois = Poi.all

    # @pois = Poi.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@pois) do |poi, marker|
      marker.lat poi.latitude
      marker.lng poi.longitude
    end
  end

  def show
    @poi = Poi.find(params[:id])
    @review = Review.new
    @poi_coordinates = { lat: @poi.latitude, lng: @poi.longitude }

  end

  def new
    @poi = Poi.new
  end

  def create
    @poi = current_user.pois.new(poi_params)
    @poi.save

    redirect_to poi_path(@poi)
  end

  private

  def find_poi
    @poi = Poi.find(params[:id])
  end

  def poi_params
     params.require(:poi).permit(:title, :caption, :category_id, :longitude, :latitude, :address, photos: [])
  end

end
