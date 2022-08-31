class AddAddressToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :address, :string
  end
end
