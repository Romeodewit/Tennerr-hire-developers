class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :status, presence: true
end
