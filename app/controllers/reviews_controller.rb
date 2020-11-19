class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @service = Service.find(params[:service_id])
    @review.service = @service
    @review.user = current_user
    if @review.save
      redirect_to service_path(@service)
    else
      render "service/show"
    end
  end

  def edit
    @reviews = Review.where(user_id: current_user)
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to service_path(@review.service)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to service_path(@review.service)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating)
  end
end
