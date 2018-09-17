class Bar < ApplicationRecord
  validates_presence_of :name, :address, :longitude, :latitude, :open, :close, :hh_start, :hh_end, :message, :deals, :owner_email
  serialize :open
  serialize :close
  serialize :hh_start
  serialize :hh_end
  has_many :choices
  has_many :user_bars
  has_many :users, through: :user_bars

end
