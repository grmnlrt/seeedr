class RenameApplicationsToBids < ActiveRecord::Migration[5.0]
  def change
    rename_table :applications, :bids
  end
end
