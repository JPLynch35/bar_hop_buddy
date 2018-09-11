class MapController < ApplicationController
  def show
    fav_bars = current_user.bars
    @geo_json = [current_user.last_long, current_user.last_lat]
    day = Time.now.strftime("%A").to_sym
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
          hh_hours: bar.hh_start[day] + ' - ' + bar.hh_end[day],
          deal1: JSON.parse(bar.deals)[0],
          deal2: JSON.parse(bar.deals)[1],
          deal3: JSON.parse(bar.deals)[2],
          deal4: JSON.parse(bar.deals)[3],
          deal5: JSON.parse(bar.deals)[4],
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
