class AddReportsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :reports, :integer
  end
end
