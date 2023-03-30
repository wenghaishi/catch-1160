class AddtokenurlToTokens < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :tokenurl, :string
  end
end
