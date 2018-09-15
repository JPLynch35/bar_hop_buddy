class Location < ApplicationRecord
  validates_presence_of :user_id, :longitude, :latitude
  belongs_to :user
  
end
