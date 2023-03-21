class AddImgUrlToToken < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :img_url, :string, null: false
  end
end
