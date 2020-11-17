class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @booking = Booking.new
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

    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :category, :price, :photos)
  end
end
