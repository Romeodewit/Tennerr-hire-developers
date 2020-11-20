class Review < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, numericality: { more_than_or_equal_to: 1, less_than_or_equal_to: 5, only_integer: true }
end
