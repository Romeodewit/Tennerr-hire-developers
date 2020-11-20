class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_title_and_category,
    against: [ :title, :category],
    using: {
      tsearch: { prefix: true }
    }

  CATEGORIES = ['Any Category', 'Front-End Development', 'Back-End Development', 'Full-Stack Development']
  validates :title, :description, :category, :price, presence: true
  validates :category, inclusion: { in: CATEGORIES }


end

