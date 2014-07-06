class AddPotentialAllergensToPost < ActiveRecord::Migration
  def change
    add_column :posts, :potential_allergens, :text
  end
end
