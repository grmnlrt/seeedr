class CreateExhibitions < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibitions do |t|
      t.string :title
      t.string :address
      t.text :description
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :min_price

      t.timestamps
    end
  end
end
