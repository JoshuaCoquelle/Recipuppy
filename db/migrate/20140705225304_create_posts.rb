class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.string :potential
      t.text :allergens

      t.timestamps
    end
  end
end
