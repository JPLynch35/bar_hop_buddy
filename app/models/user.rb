class User < ApplicationRecord
  validates :uid, uniqueness: true
  validates :email, uniqueness: true
  validates :token, uniqueness: true
  has_many :locations
  has_many :choices
  has_many :user_bars
  has_many :bars, through: :user_bars

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.save!
    end
  end
end
