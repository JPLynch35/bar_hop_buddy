require 'rails_helper'

describe 'a logged in user' do
  describe 'visiting the deals page' do
    it 'can log out' do
      user = User.create(
        uid: '239487234023434',
        email: 'Bob@gmail.com'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit deals_path
      click_on 'Log Out'

      expect(current_path).to eq(root_path)
    end
  end
end
