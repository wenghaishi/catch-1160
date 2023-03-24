class AddNumberToTokens < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :identifier, :integer, null: false, default: 0
  end
end
