class PoisController < ApplicationController

  before_action :find_poi, only: [ :show ]

  def index
    @pois = Poi.all
  end

  def show
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
    params.require(:poi).permit(:title, :caption, :category_id)
  end

end
