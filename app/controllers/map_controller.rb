class MapController < ApplicationController
  def show
    fav_bars = current_user.bars
    @geo_json = [current_user.last_long, current_user.last_lat]
    fav_bars.map do |bar|
      @geo_json << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [bar.longitude, bar.latitude]
        },
        properties: {
          name: bar.name,
          address: bar.address,
          "marker-symbol": 'marker'
        }
      }
    end
    
    respond_to do |format|
      format.html
      format.json {render json: @geo_json}
    end
  end
end
