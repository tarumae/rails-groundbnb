class AllotmentsController < ApplicationController
  def index; end

  def show
    @allotment = Allotment.find(params[:id])
    @booking = Booking.new
  end

  def new; end

  def create; end

  def destroy; end

  def update; end

  def edit; end
end
