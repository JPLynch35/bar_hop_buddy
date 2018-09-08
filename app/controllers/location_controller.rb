class LocationController < ApplicationController
  def create
    long = params[:long]
    lat = params[:lat]
    presenter = DealsPresenter.new(long, lat)
    current_user.update_attribute(:last_location, presenter.current_address)
    redirect_to deals_path
  end
end
