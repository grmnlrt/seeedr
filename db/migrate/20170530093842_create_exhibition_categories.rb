class CreateExhibitionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibition_categories do |t|
      t.references :exhibition, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
