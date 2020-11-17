class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_many_attached :photos

  CATEGORIES = ['Front-End Development', 'Back-End Development', 'Full-Stack Development']
  validates :title, :description, :category, :price, presence: true
  validates :category, inclusion: { in: CATEGORIES }

end

