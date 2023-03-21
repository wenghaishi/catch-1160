class Token < ApplicationRecord
  belongs_to :collection
  has_one :business, through: :collection
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
