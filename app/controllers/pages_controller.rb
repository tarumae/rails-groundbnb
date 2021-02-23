class PagesController < ApplicationController
  def home
    @allotments = Allotment.all
  end
end
