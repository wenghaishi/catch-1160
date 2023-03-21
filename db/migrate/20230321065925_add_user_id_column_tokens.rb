class AddUserIdColumnTokens < ActiveRecord::Migration[7.0]
  def change
    add_reference :tokens, :user, foreign_key: true
  end
end
