class Poi < ApplicationRecord
  belongs_to :category
  # belongs_to :user
  has_many   :reviews, dependent: :destroy
  has_attachment :photo
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :category, presence: true
  # validates :user, presence: true
  # validates :photo, presence: true
end
