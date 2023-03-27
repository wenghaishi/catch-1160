class Business < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :tokens, through: :collections
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  include PgSearch::Model
  pg_search_scope :search,
                  against: %i[name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
