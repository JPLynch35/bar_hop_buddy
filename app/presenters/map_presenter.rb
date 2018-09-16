class MapPresenter
  def initialize(user)
    @user = user
  end

  def locations
    geo_json = [user.last_long, user.last_lat]
    user.bars.each do |bar|
      geo_json << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [bar.longitude, bar.latitude]
        },
        properties: {
          name: bar.name,
          address: bar.address,
          hh_hours: bar.hh_start[day] + ' - ' + bar.hh_end[day],
          deal1: bar.deals[0],
          deal2: bar.deals[1],
          deal3: bar.deals[2],
          deal4: bar.deals[3],
          deal5: bar.deals[4],
          "marker-symbol": 'marker'
        }
      }
    end
    geo_json
  end

  private
  attr_reader :user

  def day
    Time.now.strftime("%A").to_sym
  end
end
