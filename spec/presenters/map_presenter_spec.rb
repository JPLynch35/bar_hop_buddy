require 'rails_helper'

describe MapPresenter do
  it 'exists' do
    user = User.create(
      uid: '239487234023434',
      email: 'Bob@gmail.com'
    )
    presenter = MapPresenter.new(user)

    expect(presenter).to be_a(MapPresenter)
  end

  describe 'instance methods' do
    before :each do
      names = ['Brothers Bar', "1UP", 'Oskar Blues', 'Fiction Brewery', 'Freshcraft', 'Thirsty Lion']
      address = ['1920 Market Street, Denver, CO', '1925 Blake Street, Denver, CO', '1624 Market Street, Denver, CO', '7101 East Colfax Avenue, Denver, CO', '1530 Blake Street, Denver, CO', '1605 Wynkoop Street, Denver, CO']
      longitude = ['-104.994192', '-104.994983', '-104.997508', '-104.905731', '-104.999540', '-105.0007']
      latitude = ['39.753057', '39.753782', '39.750111', '39.740381', '39.749920', '39.752753']
      open = { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' }
      close = { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' }
      hhstart = { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' }
      hhend = { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' }
      message = ['Come on our September 26nd for karaoke!', 'Free games on September 15th!', 'Live music on September 19th!', 'Beer slushies!']
      deals = ['$1 off all drafts', 'All beers half off', 'All 40s $5', 'Fireball shots $4', 'Half price tequila shots', 'LIT pitchers $5', '$2 PBR', '$2 Bud Light Drafts', '$4 Mojitos', '$15 Lagunitas buckets', '$3 domestic drafts', '$3 wells', '$5 margaritas']
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
          message: message.sample,
          deals: deals.sample(5),
          owner_email:  if i == 0
                          'JPLynch35@gmail.com'
                        else
                          'Bill2343241@gmail.com'
                        end
        )
      end
    end
    it 'can provide users favorite bar data to the map' do
      user = User.create(
        uid: '239487234023434',
        email: 'Bob@gmail.com',
        last_long: '-104.8772123',
        last_lat: '39.7529201'
      )
      user.user_bars.create(bar_id: 2)
      presenter = MapPresenter.new(user)
      bar = Bar.find(2)
      day = Time.now.strftime("%A").to_sym
      expected = [
        user.last_long,
        user.last_lat,
        {
          type: 'Feature',
          geometry: {
            type: 'Point',
            coordinates: [bar.longitude, bar.latitude]
          },
          properties: {
            name: bar.name,
            address: bar.address,
            hh_hours: bar.hh_start[day] + ' - ' + bar.hh_end[day],
            deal1: bar.deals[0],
            deal2: bar.deals[1],
            deal3: bar.deals[2],
            deal4: bar.deals[3],
            deal5: bar.deals[4],
            "marker-symbol": 'marker'
          }
        }
      ]

      expect(presenter.locations).to eq(expected)
    end
  end
end
