class MapController < ApplicationController
  def show
    @presenter = MapPresenter.new(current_user)
  end
end
