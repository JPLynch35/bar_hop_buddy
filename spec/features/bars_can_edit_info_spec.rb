require 'rails_helper'

describe 'a bar owner' do
  describe 'can log in' do
    it 'and edit their specials and hours' do
      stub_omni_auth
      visit ('/auth/google_oauth2')
      
      within('nav') do
        click_on 'Edit Your Bar'
      end

      expect(current_path).to eq(edit_bars_path(1))
    end
  end
end
