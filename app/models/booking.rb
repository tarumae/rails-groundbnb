class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :allotment
  validates :start_date, :end_date, presence: true
  validate :check_end_date_is_after_start_date

  private

  def check_end_date_is_after_start_date
    return if start_date.blank? || end_date.blank?

    errors.add(:start_date, "Can not be after the end date.") if start_date > end_date
  end
end
