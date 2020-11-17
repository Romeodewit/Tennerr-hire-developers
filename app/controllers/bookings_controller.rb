class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update]
  before_action :find_service, only: [:create]
  before_action :find_user, only: [:create]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.service = @service
    @booking.date = Date.today
    @booking.status = "Pending"
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render '/services/show'
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def find_user
    @user = current_user
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_service
    @service = Service.find(params[:service_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :deadline)
  end
end
