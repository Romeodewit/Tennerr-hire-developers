class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  STATUS = ["Accept", "Pending", "Decline"]

  validates :date, presence: true
  validates :deadline, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
end
