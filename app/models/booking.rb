class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :allotment
  validates :start_date, :end_date, presence: true
  validate :check_end_date_is_after_start_date
  validate :check_dates_are_not_in_the_past

  private

  def check_end_date_is_after_start_date
    return if start_date.blank? || end_date.blank?

    errors.add(:start_date, "Can not be after the end date.") if start_date > end_date
  end

  def check_dates_are_not_in_the_past
    starting_date = start_date.strftime("%d/%m/%Y")
    ending_date = end_date.strftime("%d/%m/%Y")
    now = Time.now.strftime("%d/%m/%Y")
    errors.add(:start_date, "Date can not be in the past") if starting_date < now || ending_date < now
  end
end
