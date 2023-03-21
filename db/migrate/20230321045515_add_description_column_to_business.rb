class AddDescriptionColumnToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :description, :string, null: false, default: ""
  end
end
