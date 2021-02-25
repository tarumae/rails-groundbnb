class AllotmentsController < ApplicationController
  before_action :set_allotment, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @allotments = Allotment.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @allotments = Allotment.all
    end
    @markers = @allotments.geocoded.map do |allotment|
      {
        lat: allotment.latitude,
        lng: allotment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { allotment: allotment }),
        image_url: helpers.asset_url('icons8-big-carrot-64.png')
      }
    end
  end

  def show
    @booking = Booking.new
    @markers =
      [{
        lat: @allotment.latitude,
        lng: @allotment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { allotment: @allotment }),
        image_url: helpers.asset_url('icons8-big-carrot-64.png')
      }]
  end

  def new
    @allotment = Allotment.new
  end

  def create
    @allotment = Allotment.create(allotment_params)
    @allotment.user = current_user
    if @allotment.save
      redirect_to allotment_path(@allotment), notice: 'Allotment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @allotment.destroy
    redirect_to allotments_path, notice: 'Allotment was successfully destroyed.'
  end

  def update
    if @allotment.update(allotment_params)
      redirect_to allotment_path(@allotment), notice: 'Allotment was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  private

  def set_allotment
    @allotment = Allotment.find(params[:id])
  end

  def allotment_params
    params.require(:allotment).permit(:name, :description, :location, :price, :area_size, photos: [])
  end
end
