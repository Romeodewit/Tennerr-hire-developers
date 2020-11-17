class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings

  CATEGORIES = ['Front-End Development', 'Back-End Development', 'Full-Stack Development']
  validates :title, :description, :category, :price, presence: true
  validates :user_id, presence: true, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES }

end