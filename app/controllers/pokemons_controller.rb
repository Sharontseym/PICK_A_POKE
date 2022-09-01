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

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to_pokemon_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :element, :move, :user_id, :photo)
  end
end
