class Pokemon < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_one_attached :photo

  validates :name, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

end
