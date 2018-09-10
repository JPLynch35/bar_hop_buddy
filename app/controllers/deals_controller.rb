class DealsController < ApplicationController
  def index
    # RAD_PER_DEG = Math::PI / 180
    # RM = 6371000 # Earth radius in meters

    # def distance_between(current_user.last_lat, current_user.last_long, lat2, lon2)
    #   lat1_rad, lat2_rad = lat1 * RAD_PER_DEG, lat2 * RAD_PER_DEG
    #   lon1_rad, lon2_rad = lon1 * RAD_PER_DEG, lon2 * RAD_PER_DEG

    #   a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
    #   c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    #   RM * c # Delta in meters
    # end
  end
end
