class RenameMinPriceToExhibitions < ActiveRecord::Migration[5.0]
  def change
    rename_column :exhibitions, :min_price, :min_price_cents
  end
end
