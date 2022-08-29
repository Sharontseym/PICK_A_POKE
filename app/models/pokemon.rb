class Pokemon < ApplicationRecord
  validates :element, uniqueness: true
  validates :name, uniqueness: true
  has_many :bookings
  belongs_to :user
end
