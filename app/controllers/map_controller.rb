class MapController < ApplicationController
  def show
    fav_bars = current_user.bars
    @geo_json = Array.new
    fav_bars.each do |bar|
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
