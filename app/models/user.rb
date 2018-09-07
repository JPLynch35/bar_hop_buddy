class User < ApplicationRecord
  validates_presence_of :uid, :email, :token

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.email = auth.info.email
      user.uid = auth.uid
      user.token = auth.credentials.token
      user.save!
    end
  end
end
