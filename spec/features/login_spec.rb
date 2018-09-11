require 'rails_helper'

describe 'a visitor' do
  describe 'visiting the welcome page' do
    it 'will be auto redirected to sign in with oauth via Google' do
      stub_omni_auth
      visit ('/auth/google_oauth2')

      expect(current_path).to eq(deals_path)

      within('nav') do
        expect(page).to have_button('Find Your Bars')
      end
      expect(User.last.id).to eq(1)
      expect(User.last.uid).to eq('83726423')
      expect(User.last.email).to eq('Billy3241@gmail.com')
      expect(User.last.token).to eq('hdsf7324fds')
    end
  end
end
