class User < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :incoming_bookings, through: :services, source: :bookings
  has_many :reviews, dependent: :destroy

  has_many_attached :photos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
