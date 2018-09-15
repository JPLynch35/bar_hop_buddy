require 'rails_helper'

describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
  end
end
