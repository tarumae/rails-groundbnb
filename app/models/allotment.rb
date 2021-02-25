class Allotment < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, :location, :price, :area_size, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many_attached :photos
end
