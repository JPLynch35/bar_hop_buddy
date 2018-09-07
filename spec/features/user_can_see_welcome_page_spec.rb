require 'rails_helper'

describe 'a visitor' do
  describe 'visiting the welcome page' do
    it 'can see the apps name' do
      visit root_path

      expect(page).to have_content('BarH')
      expect(page).to have_content('pBuddy')
    end
    it 'is redirected to the deals page after 2 seconds' do
      visit root_path

      sleep(4.0)

      expect(current_path).to eq(deals_path)
    end
  end
end
