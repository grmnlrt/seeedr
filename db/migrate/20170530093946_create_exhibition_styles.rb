class CreateExhibitionStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibition_styles do |t|
      t.references :exhibition, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
