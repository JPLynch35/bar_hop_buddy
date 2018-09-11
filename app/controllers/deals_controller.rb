class DealsController < ApplicationController
  def index
    bars = Bar.all
    @nearby_bars = bars.map do |bar|
      bar if distance_between(current_user.last_lat.to_f, current_user.last_long.to_f, bar.latitude.to_f, bar.longitude.to_f) < 5280
    end.compact
    respond_to do |format|
      format.html
      format.json { render json: @nearby_bars }
    end
  end

  private
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
