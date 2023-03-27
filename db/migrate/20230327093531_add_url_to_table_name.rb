class AddUrlToTableName < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :url, :string
  end
end
