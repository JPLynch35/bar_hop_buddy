require 'rails_helper'

describe Choice, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:click) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:bar_id) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:bar) }
  end

  it 'exists' do
    choice = Choice.create(click: true, user_id: 1, bar_id: 1)

    expect(choice).to be_a(Choice)
  end
end
