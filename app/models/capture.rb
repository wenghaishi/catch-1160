class Capture < ApplicationRecord
  belongs_to :token
  belongs_to :user
  validates :token_id, uniqueness: true
end
