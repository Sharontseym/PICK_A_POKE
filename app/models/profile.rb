class Profile < ApplicationRecord
  belongs_to :user, required: true, autosave: true
  has_one_attached :photo

end
