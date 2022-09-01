class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  has_one_attached :photo
end
