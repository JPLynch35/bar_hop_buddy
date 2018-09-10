class Bar < ApplicationRecord
  validates_presence_of :name, :address, :open, :close, :hh_start, :hh_end, :message, :deals, :id_key
  serialize :open
  serialize :close
  serialize :hh_start
  serialize :hh_end
  has_many :user_bars
  has_many :users, through: :user_bars

end
