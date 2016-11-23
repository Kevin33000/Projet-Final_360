class Poi < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many   :reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
