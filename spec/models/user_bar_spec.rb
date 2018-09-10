require 'rails_helper'

describe UserBar, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:bar_id) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:bar) }
  end
end
