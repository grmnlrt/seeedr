class ChangeValueIsCompanyToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :is_company, :boolean
  end
end
