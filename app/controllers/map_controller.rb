class MapController < ApplicationController
  def show
    fav_bars = UserBars.where(user_id: current_user.id)
    @geo_json = Array.new
    fav_bars.each do |bar|
      @geo_json << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [bar.longitude, happy_hour.latitude]
        },
        properties: {
          name: happy_hour.name,
          address: happy_hour.street,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
  end
end
