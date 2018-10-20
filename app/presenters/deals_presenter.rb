class DealsPresenter
  def initialize(long, lat)
    @service = MapBoxService.new(long, lat)
    @long = long
    @lat = lat
  end

  def current_address
    service.converted_address
  end

  def nearby_bars
    bars = Bar.all.order('random()')
    bars.map do |bar|
      ## removed to show app work outside of downtown Denver
      # bar if distance_between(lat.to_f, long.to_f, bar.latitude.to_f, bar.longitude.to_f) < 2640
      
      ## added to show app work outside of downtown Denver
      bar
    end.compact
  end

  private
  attr_reader :service, :lat, :long

  def distance_between(lat1, lon1, lat2, lon2)
    rad_per_deg = Math::PI / 180
    rm = 6371000
    lat1_rad = lat1 * rad_per_deg
    lon1_rad = lon1 * rad_per_deg
    lat2_rad = lat2 * rad_per_deg
    lon2_rad = lon2 * rad_per_deg
    a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))
    rm * c * 3.28084
  end
end
