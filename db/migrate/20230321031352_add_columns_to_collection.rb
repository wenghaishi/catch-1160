class AddColumnsToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :description, :string, null: false, default: ""
    add_column :collections, :category, :string, null: false, default: ""
  end
end
