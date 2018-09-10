require 'rails_helper'

describe Bar, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:open) }
    it { should validate_presence_of(:close) }
    it { should validate_presence_of(:hh_start) }
    it { should validate_presence_of(:hh_end) }
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:deals) }
    it { should validate_presence_of(:id_key) }
  end

  describe 'relationships' do
    it { should have_many(:user_bars) }
    it { should have_many(:users).through(:user_bars) }
  end
end
