class BookingsController < ApplicationController

  def create
    @booking = current_user.bookings.new(booking_params)
    @booking.flat_id = params[:flat_id]
    @booking.accepted = false
    if @booking.save
      redirect_to user_bookings_path(params[:user_id])
    else
      render "flats/show"
    end
  end


  def index
    @bookings = Booking.all
  end

  def booking_params
    params.require(:booking).permit(:date_arrival, :date_departure, :people_number)
  end
end
