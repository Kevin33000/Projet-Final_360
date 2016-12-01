class Review < ApplicationRecord
  # belongs_to :user
  belongs_to :poi
  validates :comment, length: { minimum: 10 }
end
