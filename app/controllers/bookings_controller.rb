class BookingsController < ApplicationController
  def create
    @booking = Booking.new(strong_params)
    @pokemon = Pokemon.find(params[:pokemon_id])

    @booking.user = current_user
    @booking.pokemon = @pokemon
    if @booking.save
      redirect_to profile_path
    else
      render 'pokemons/show', status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params.require(:booking).permit(:date, :pokemon_id)
  end
end
