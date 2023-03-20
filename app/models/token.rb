class Token < ApplicationRecord
  belongs_to :collection
  has_one :business, through: :collection
end
