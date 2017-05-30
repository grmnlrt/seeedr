class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :status
      t.integer :price
      t.references :user, foreign_key: true
      t.references :exhibition, foreign_key: true

      t.timestamps
    end
  end
end
