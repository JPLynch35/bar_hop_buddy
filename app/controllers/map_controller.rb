class MapController < ApplicationController
  def show
    respond_to do |format|
      format.html
      format.json {render json: MapPresenter.new(current_user).locations}
    end
  end
end
