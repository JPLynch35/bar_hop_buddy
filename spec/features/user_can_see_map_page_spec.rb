require 'rails_helper'

describe 'a user' do
  describe 'visiting the map page' do
    it 'can see Find More Bars button in nav' do
      user = User.new(
        uid: '239487234023434',
        email: 'Bob@gmail.com',
        token: 'hsdf873rjbhsdf'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit map_path

      expect(page).to have_button('Find More Bars')

      click_on 'Find More Bars'

      expect(current_path).to eq(deals_path)
    end
    it 'can see a map with their current location' do
      user = User.new(
        uid: '239487234023434',
        email: 'Bob@gmail.com',
        token: 'hsdf873rjbhsdf'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit deals_path
      click_on 'Calculate Location'
      click_on 'Find Your Bars'

      expect(current_path).to eq(map_path)
    end
  end
end
