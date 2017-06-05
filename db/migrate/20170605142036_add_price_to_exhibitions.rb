class AddPriceToExhibitions < ActiveRecord::Migration[5.0]
  def change
    add_column :exhibitions, :price, :integer
  end
end
