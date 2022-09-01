class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @pokemons.geocoded.map do |pokemon|
      {
        lat: pokemon.latitude,
        lng: pokemon.longitude
      }
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
  end
end
