class Poi < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many   :reviews
  has_attachments :photos, maximum: 2
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
