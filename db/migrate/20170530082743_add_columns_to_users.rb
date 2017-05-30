class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :is_company, :boolean
    add_column :users, :description, :text
    add_column :users, :address, :string
    add_column :users, :birthday, :date
    add_column :users, :website, :string
  end
end
