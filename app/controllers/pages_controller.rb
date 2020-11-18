class PagesController < ApplicationController

  def home
    @bookings = Booking.where(user: current_user).limit(4)
    @services = Service.where(user: current_user).limit(2)
    @user = current_user
  end
end
