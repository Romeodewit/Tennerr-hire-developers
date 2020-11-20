class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @bookings = Booking.where(user: current_user).limit(4)
    @services = Service.where(user: current_user).limit(2)
    @services_home = Service.all.limit(6)
    @user = current_user
  end
end
