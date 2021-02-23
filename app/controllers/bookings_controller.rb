class BookingsController < ApplicationController
  def create
    @allotment = Allotment.find(params[:allotment_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.allotment = @allotment
    @booking.total_price = @allotment.price * ((@booking.end_date - @booking.start_date) / 12)
    raise
    if @booking.save
      flash[:notice] = "You have successfully booked #{@allotment.name}"
    else
      flash[:alert] = "End date can not be before start date."
    end
    redirect_to allotment_path(@allotment)
  end

  def destroy; end

  def approve; end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
