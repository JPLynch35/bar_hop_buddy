require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:uid) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:token) }
  end
  describe 'relationships' do
    it { should have_many(:user_bars) }
    it { should have_many(:bars).through(:user_bars) }
    it { should have_many(:choices) }
  end
  it 'exists' do
    user = User.create(
      uid: '239487234023434',
      email: 'Bob@gmail.com',
      token: 'hsdf873rjbhsdf'
    )

    expect(user).to be_a(User)
  end
end
