class CreateDangers < ActiveRecord::Migration
  def change
    create_table :dangers do |t|
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
