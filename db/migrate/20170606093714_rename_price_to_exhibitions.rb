class RenamePriceToExhibitions < ActiveRecord::Migration[5.0]
  def change
    rename_column :exhibitions, :price, :price_cents
  end
end
