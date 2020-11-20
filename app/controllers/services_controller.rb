class ServicesController < ApplicationController
  def index
    # @services = Service.all
    @services = Service.all
    if params[:query] && params[:query] != ""
      @services = Service.search_by_title_and_category(params[:query])
    end
    if params[:filter] && params[:filter] != 'Any Category'
      @services = @services.search_by_title_and_category(params[:filter])
    end
  end

  def show
    @service = Service.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.where(service_id: @service).order(created_at: :desc)
  end

  def new
    @service = Service.new
  end

  def create
    @user = current_user
    @service = Service.new(service_params)
    @service.user = @user

    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @service.update(service_params)

    redirect_to service_path(@service)
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to root_path
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :category, :price, photos: [])
  end
end
