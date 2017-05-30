class ChangeStatusToApplications < ActiveRecord::Migration[5.0]
  def change
    change_column :applications, :status, :string, :default => "pending"
  end
end
