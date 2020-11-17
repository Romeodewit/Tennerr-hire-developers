class PagesController < ApplicationController

  def home
    @bookings = Bookings.all
    @services = Services.all
    @user = current_user
  end
end
