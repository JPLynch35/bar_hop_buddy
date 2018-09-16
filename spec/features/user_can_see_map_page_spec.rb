require 'rails_helper'

describe 'a user' do
  describe 'visiting the map page' do
    before :each do
      user = User.create(
        uid: '239487234023434',
        email: 'Bob@gmail.com'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    it 'can see Find More Bars button in nav' do
      visit map_path

      expect(page).to have_button('Select Your Bars')

      click_on 'Select Your Bars'

      expect(current_path).to eq(deals_path)
    end
    it 'can see a map with their current location' do
      visit deals_path
      click_on 'Find Your Bars'

      expect(current_path).to eq(map_path)
    end
  end
end
