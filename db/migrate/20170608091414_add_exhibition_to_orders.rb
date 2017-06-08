class AddExhibitionToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :exhibition, foreign_key: true
  end
end
