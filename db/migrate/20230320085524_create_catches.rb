class CreateCatches < ActiveRecord::Migration[7.0]
  def change
    create_table :catches do |t|
      t.references :token, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
