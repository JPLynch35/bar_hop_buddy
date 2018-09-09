class User < ApplicationRecord
  validates :uid, uniqueness: true
  validates :email, uniqueness: true
  validates :token, uniqueness: true

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.save!
    end
  end
end
