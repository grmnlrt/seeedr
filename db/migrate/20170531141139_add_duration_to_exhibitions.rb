class AddDurationToExhibitions < ActiveRecord::Migration[5.0]
  def change
    add_column :exhibitions, :duration, :integer
  end
end
