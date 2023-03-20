class Collection < ApplicationRecord
  belongs_to :business
  has_many :tokens
  validates :name, presence: true
end
