class RenameBidPriceToOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :bid_price, :artist_name
  end
end
