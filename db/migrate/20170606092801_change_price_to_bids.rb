class ChangePriceToBids < ActiveRecord::Migration[5.0]
  def change
    rename_column :bids, :price, :price_cents
  end
end
