require 'rails_helper'

describe MapBoxService do
  it 'exists' do
    long = -104.8772123
    lat = 39.7529201
    service = MapBoxService.new(long, lat)

    expect(service).to be_a(MapBoxService)
  end

  describe 'instance methods' do
    before :each do
      user = User.new(
        uid: '239487234023434',
        email: 'Bob@gmail.com'
      )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      long = -104.8772123
      lat = 39.7529201
      @service = MapBoxService.new(long, lat)
    end
    it 'calls api and retrieves current address hash' do
      expect(@service.call_current_address).to be_a(Hash)
      expect(@service.call_current_address[:features]).to be_an(Array)
      expect(@service.call_current_address[:features].first).to be_a(Hash)
      expect(@service.call_current_address[:features].first).to have_key(:address)
      expect(@service.call_current_address[:features].first).to have_key(:text)
      expect(@service.call_current_address[:features].first).to have_key(:context)
      expect(@service.call_current_address[:features].first[:context]).to be_an(Array)
      expect(@service.call_current_address[:features].first[:context].first).to be_a(Hash)
      expect(@service.call_current_address[:features].first[:context].second).to have_key(:text)
      expect(@service.call_current_address[:features].first[:context].third).to have_key(:text)
    end
    it 'converts current address hash to address string' do
      expect(@service.converted_address).to be_a(String)
      expect(@service.converted_address).to eq('2501 N Dallas St Aurora, Colorado')
    end
  end
end
