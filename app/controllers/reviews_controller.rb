class ReviewsController < ApplicationController
  def create
    @poi = Poi.find(params[:poi_id])
    @review = Review.new(review_params)
    @review.poi = @poi
    if @review.save
      redirect_to poi_path(@poi)
    else
      render 'pois/show'
    end
  end

  def new
    @review = @poi.reviews.new(review_params)
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  end

  def update
  end



  private

  def find_review
  @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :poi_id, :comment, :rating)
  end

end
