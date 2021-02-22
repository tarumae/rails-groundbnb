class Allotment < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, :location, :price, :area_size, presence: true
end
