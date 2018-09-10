class LocationController < ApplicationController
  def create
    long = params[:long]
    lat = params[:lat]
    presenter = DealsPresenter.new(long, lat)
    current_user.update_attributes(last_location: presenter.current_address, last_long: long, last_lat: lat)
    redirect_to deals_path
  end
end
