class PoisController < ApplicationController

  before_action :find_poi, only: [ :show ]

  def index
    @pois = Poi.all

    @pois = Poi.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@pois) do |poi, marker|
      marker.lat poi.latitude
      marker.lng poi.longitude
      marker.infowindow render_to_string(partial: "/pois/poi", locals: { poi: poi })

    end
  end

  def show
    @poi = Poi.find(params[:id])
    @review = Review.new
    @poi_coordinates = { lat: @poi.latitude, lng: @poi.longitude }
    @hash = Gmaps4rails.build_markers([@poi]) do |poi, marker|
      marker.lat poi.latitude
      marker.lng poi.longitude
    end
  end

  def new
    @poi = Poi.new
  end

  def create
    @poi = Poi.new(poi_params)
    if @poi.save
      redirect_to poi_path(@poi)
    else
      flash[:alert] = "Erreur lors de la création"
      render :new
    end
  end

  private

  def find_poi
    @poi = Poi.find(params[:id])
  end

  def poi_params
     params.require(:poi).permit(:title, :caption, :category_id, :longitude, :latitude, :address, :photo)
  end

end
