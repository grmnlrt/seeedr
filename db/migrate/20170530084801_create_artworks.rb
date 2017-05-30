class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.text :description
      t.date :date
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
