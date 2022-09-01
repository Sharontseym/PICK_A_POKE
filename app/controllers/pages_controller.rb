class PagesController < ApplicationController
  
  def home
    # @pokemon = Pokemon.find(params[:id])
    # @booking = Booking.new
   

    if params[:query].present?
      sql_query = "name ILIKE :query OR element ILIKE :query"
      @pokemons = Pokemon.where(sql_query, query: "%#{params[:query]}%")
    else
      @pokemons = Pokemon.all
    end
  
    # if params[:query].present?
    #   @pokemons = Pokemon.where(name: params[:query])
    # else
    #   @pokemons = Pokemon.all
    # end
    # The `geocoded` scope filters only flats with coordinates
     @markers = @pokemons.geocoded.map do |pokemon|
    {
    lat: pokemon.latitude,
    lng: pokemon.longitude
    }
    end
  end

  # def index
  #   @pokemons = Pokemon.all
  # end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
  end
  
  def profile
  end

end
