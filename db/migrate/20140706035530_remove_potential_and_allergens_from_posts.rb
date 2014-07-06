class RemovePotentialAndAllergensFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :allergens, :text
    remove_column :posts, :potential, :string
  end
end
