class AddColumsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :img_url, :string, null: false
    add_column :users, :account_type, :string, null: false
  end
end
