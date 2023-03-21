class Collection < ApplicationRecord
  belongs_to :business
  has_many :tokens, dependent: :destroy
  has_one_attached :banner
  has_one_attached :photo
  validates :name, presence: true
end
