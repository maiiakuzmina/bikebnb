class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end
end
