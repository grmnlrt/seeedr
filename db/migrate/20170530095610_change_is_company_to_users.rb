class ChangeIsCompanyToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :is_company, :boolean, :default => false
  end
end
