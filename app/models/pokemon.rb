class Pokemon < ApplicationRecord
  validates :element, uniqueness: true
  validates :name, uniqueness: true
  has_many :bookings
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
