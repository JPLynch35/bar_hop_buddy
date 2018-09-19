 require 'rails_helper'

describe 'a user' do
  describe 'visiting the deals page' do
    before :each do
      Bar.create(
        name: 'Bobs Bar',
        address: '2134 Main Street, Denver, Co',
        longitude: '-104.13021',
        latitude: '39.99231',
        open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
        close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
        hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
        hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
        message: 'hi',
        deals: {
          Sunday: ['1', '2', '3', '4', '5'],
          Monday: ['1', '2', '3', '4', '5'],
          Tuesday: ['1', '2', '3', '4', '5'],
          Wednesday: ['1', '2', '3', '4', '5'],
          Thursday: ['1', '2', '3', '4', '5'],
          Friday: ['1', '2', '3', '4', '5'],
          Saturday: ['1', '2', '3', '4', '5']
        },
        owner_email: 'Bob122421@gmail.com'
      )
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
