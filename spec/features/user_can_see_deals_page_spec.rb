 require 'rails_helper'

describe 'a user' do
  describe 'visiting the deals page' do
    before :each do
      user = User.create(
        uid: '239487234023434',
        email: 'Bob@gmail.com'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    it 'can see Find Your Bars button in nav' do
      visit deals_path

      expect(page).to have_button('Find Your Bars')

      click_on 'Find Your Bars'

      expect(current_path).to eq(map_path)
    end
  end
end
