class AddReferenceColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :business, null: false, foreign_key: true
  end
end
