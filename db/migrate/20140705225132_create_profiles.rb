class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :f_name
      t.string :l_name
      t.string :address
      t.string :city
      t.string :treat_name
      t.string :breeds_owned

      t.timestamps
    end
  end
end
