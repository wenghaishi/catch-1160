class AddBannerUrlColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :banner_url, :string, null: false
  end
end
