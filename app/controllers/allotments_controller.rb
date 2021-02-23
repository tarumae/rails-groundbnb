class AllotmentsController < ApplicationController
  def index
    @allotments = Allotment.all
    @search = params["search"]
    if @search.present?
      @location = @search["location"]
      @results = Allotment.where("location ILIKE ?", @location)
    end
  end

  def show; end

  def new; end

  def create; end

  def destroy; end

  def update; end

  def edit; end
end
