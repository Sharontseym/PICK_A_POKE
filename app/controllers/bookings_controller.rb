class BookingsController < ApplicationController
  def create
    @booking = Booking.new(strong_params)
  end

  private
  def strong_params
    params.require(:booking).permit(:date, :pokemon_id)
  end
end
