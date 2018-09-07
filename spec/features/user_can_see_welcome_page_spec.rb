require 'rails_helper'

describe 'an visitor' do
  describe 'visiting the welcome page' do
    it 'can see the apps name' do
      visit root_path

      expect(page).to have_content('BarH')
      expect(page).to have_content('pBuddy')
    end
  end
end
