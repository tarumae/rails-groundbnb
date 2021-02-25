class BookingsController < ApplicationController
  before_action :set_allotment, only: %i[create]

  def index
    @my_bookings = current_user.bookings
    @my_allotments = current_user.allotments
  end

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
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.approved && @booking.allotment.user != current_user
      flash[:alert] = "This booking has already been approved. Please contact the owner of the allotment at #{@booking.allotment.user.email}."
    else
      @booking.destroy
      flash[:alert] = "Your booking for #{@booking.allotment.name} has been deleted."
    end
    redirect_to bookings_path
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.approved = params[:approved]
    if @booking.approved
      if @booking.save
        flash[:notice] = "You have accepted the booking by #{@booking.user.email} for #{@booking.start_date.strftime('%d/%m/%Y')} - #{@booking.end_date.strftime('%d/%m/%Y')}"
      else
        flash[:alert] =
          "Something went wrong. Please try again later. If this issue persists, please contact the support team."
      end
    elsif @booking.approved == false
      if @booking.save
        flash[:alert] = "You have rejected the booking by #{@booking.user.email} for #{@booking.start_date.strftime('%d/%m/%Y')} - #{@booking.end_date.strftime('%d/%m/%Y')}"
      else
        flash[:alert] = "Something went wrong. Please try again later. If this issue persists, please contact the support team."
      end
    end
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_allotment
    @allotment = Allotment.find(params[:allotment_id])
  end
end
