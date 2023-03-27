class AddDescriptionAndConditionsToTokens < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :description, :string
    add_column :tokens, :conditions, :string
  end
end
