class PagesController < ApplicationController
  def home
    # @pokemon = Pokemon.find(params[:id])
    # @booking = Booking.new
    @pokemons = Pokemon.all
  end

  # def index
  #   @pokemons = Pokemon.all
  # end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
  end
end
