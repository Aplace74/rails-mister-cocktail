class ReviewsController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(cocktail_id: @cocktail.id)
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = Cocktail.find(params[:cocktail_id])
    @cocktail = @review.cocktail
    @reviews = @cocktail.reviews # we need for render
    if @review.save
      redirect_to cocktail_path(@review.cocktail)
    else
      render "cocktails/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :cocktail_id)
  end
end
