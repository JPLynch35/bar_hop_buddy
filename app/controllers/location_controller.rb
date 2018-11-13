class LocationController < ApplicationController
  def create
    long = params[:long]
    lat = params[:lat]
    presenter = DealsPresenter.new(long, lat)
    current_user.update_attributes(last_location: presenter.current_address, last_long: long, last_lat: lat)
    current_user.locations.create(longitude: long, latitude: lat) unless recently_logged_location
    redirect_to deals_path
  end

  private
  def recently_logged_location
    current_user.locations.where(created_at: (Time.zone.now.utc - 1.hour)..Time.zone.now.utc).any?
  end
end
