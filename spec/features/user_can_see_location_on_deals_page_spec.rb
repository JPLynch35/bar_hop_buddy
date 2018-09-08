require 'rails_helper'

describe 'a user' do
  describe 'visiting the deals page' do
    it 'can see their current location' do
      user = User.new(
        uid: '239487234023434',
        email: 'Bob@gmail.com',
        token: 'hsdf873rjbhsdf'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit deals_path

      expect(page).to have_button('Calculate Location')
    end
  end
end
