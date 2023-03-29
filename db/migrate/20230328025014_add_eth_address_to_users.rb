class AddEthAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :eth_address, :string
  end
end
