require 'rails_helper'

describe DealsPresenter do
  it 'exists' do
    long = -104.8772123
    lat = 39.7529201
    presenter = DealsPresenter.new(long, lat)

    expect(presenter).to be_a(DealsPresenter)
  end

  describe 'instance methods' do
    it 'can display the current user address' do
      long = -104.8772123
      lat = 39.7529201
      presenter = DealsPresenter.new(long, lat)

      expect(presenter.current_address).to be_a(String)
      expect(presenter.current_address).to eq('2501 N Dallas St Aurora, Colorado')
    end
  end
end
