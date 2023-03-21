class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :address, null: false
      t.float :longitude
      t.float :latitude
      t.boolean :caught, null: false, default: false
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
