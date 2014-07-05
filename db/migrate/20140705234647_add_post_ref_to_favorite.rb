class AddPostRefToFavorite < ActiveRecord::Migration
  def change
    add_reference :favorites, :post, index: true
  end
end
