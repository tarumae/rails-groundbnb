class BookingsController < ApplicationController
  before_action :set_allotment, only: %i[create destroy]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.allotment = @allotment
    @booking.total_price = @allotment.price * ((@booking.end_date.year * 12 + @booking.end_date.month) - (@booking.start_date.year * 12 + @booking.start_date.month))
    if @booking.save
      flash[:notice] = "You have successfully booked #{@allotment.name}"
    else
      flash[:alert] = "Something went wrong. Please check your dates."
    end
    redirect_to allotment_path(@allotment)
  end

  def destroy; end

  def approve; end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_allotment
    @allotment = Allotment.find(params[:allotment_id])
  end
end
