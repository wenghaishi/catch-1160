class Business < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :tokens, through: :collections
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
