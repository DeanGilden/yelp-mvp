class ReviewsController < ApplicationController
  
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to restaurant_path(params[:restaurant_id])
    else
      render :new
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end
end
