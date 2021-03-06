require 'rails_helper'

describe 'a user' do
  before :each do
    names = ['Brothers Bar', '1UP']
    address = ['1920 Market Street, Denver, CO', '1925 Blake Street, Denver']
    longitude = ['-104.994192', '-104.994983']
    latitude = ['39.753057', '39.753782']
    open = { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' }
    close = { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' }
    hhstart = { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' }
    hhend = { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' }
    message = ['Come on our September 26nd for karaoke!']
    deals = ['$1 off all drafts', 'All beers half off', 'All 40s $5', 'Fireball shots $4', 'Half price tequila shots']
    names.each_with_index do |bar_name, i|
      Bar.create(
        name: bar_name,
        address: address[i],
        longitude: longitude[i],
        latitude: latitude[i],
        open: open,
        close: close,
        hh_start: hhstart,
        hh_end: hhend,
        message: message.first,
        deals: {
          Sunday: deals,
          Monday: deals,
          Tuesday: deals,
          Wednesday: deals,
          Thursday: deals,
          Friday: deals,
          Saturday: deals
        },
        owner_email:  if i == 0
                        'JPLynch35@gmail.com'
                      else
                        'Bill2343241@gmail.com'
                      end
      )
    end
  end
  describe 'logged in as a bar owner' do
    it 'and edit their specials and hours' do
      stub_omni_auth
      visit ('/auth/google_oauth2')
      
      within('nav') do
        click_on 'Edit Your Bar'
      end

      expect(current_path).to eq(edit_bar_path(Bar.first))
      within '#bar_message' do
        expect(page).to have_content('Come on our September 26nd for karaoke!')
      end

      fill_in :bar_message, with: 'Free beer all day!'
      click_on 'Update Message'

      expect(page).to have_content('Brothers Bar successfully updated.')
      within '#bar_message' do
        expect(page).to have_content('Free beer all day!')
      end
    end
  end
end
