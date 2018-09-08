class LocationController < ApplicationController
  def create
    long = params[:long]
    lat = params[:lat]
    presenter = DealsPresenter.new(long, lat)
    session[:current_location] = presenter.current_address
    redirect_to deals_path
  end
end
