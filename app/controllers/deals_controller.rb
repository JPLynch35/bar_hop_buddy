class DealsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: DealsPresenter.new(current_user.last_long, current_user.last_lat).nearby_bars }
    end
  end
end
