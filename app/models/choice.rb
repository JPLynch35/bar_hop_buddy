class Choice < ApplicationRecord
  validates_presence_of :user_id, :bar_id
  belongs_to :user
  belongs_to :bar

end
