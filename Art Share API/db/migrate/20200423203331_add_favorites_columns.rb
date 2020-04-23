class AddFavoritesColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :own_favorites, :boolean, default: false
    add_column :artwork_shares, :shared_favorites, :boolean, default: false
    
  end
end


# Favorite thing I drew?
# Favorite things shared with me

#:boolean, default: true