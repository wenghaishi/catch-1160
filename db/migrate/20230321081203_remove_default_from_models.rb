class RemoveDefaultFromModels < ActiveRecord::Migration[7.0]
  def change
    change_column :businesses, :name, :string, default: nil
    change_column :businesses, :description, :string, default: nil
    change_column :businesses, :address, :string, default: nil
    change_column :collections, :description, :string, default: nil
    change_column :collections, :category, :string, default: nil
    change_column :tokens, :address, :string, default: nil
  end
end
