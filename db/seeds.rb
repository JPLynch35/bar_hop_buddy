# Bar.create(
#   name: 'Brothers Bar',
#   address: '1920 Market Street, Denver, CO',
#   longitude: '-104.994192',
#   latitude: '39.753057',
#   open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
#   close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
#   hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
#   hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
#   message: 'Come on our September 26nd for karaoke!',
#   deals: 'Budlight pitchers $5\nFireball shots $4',
#   id_key: SecureRandom.hex(16)
# )
# Bar.create(
#   name: '1UP',
#   address: '1925 Blake Street, Denver, CO',
#   longitude: '-104.994983',
#   latitude: '39.753782',
#   open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
#   close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
#   hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
#   hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
#   message: 'Free games on September 15th!',
#   deals: 'All 40s $5\nFireball shots $4',
#   id_key: SecureRandom.hex(16)
# )
# Bar.create(
#   name: 'Oscar Blues',
#   address: '1624 Market Street, Denver, CO',
#   longitude: '-104.997508',
#   latitude: '39.750111',
#   open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
#   close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
#   hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
#   hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
#   message: 'Live music on September 19th!',
#   deals: 'All beers half off!',
#   id_key: SecureRandom.hex(16)
# )
# Bar.create(
#   name: 'Fiction Brewery',
#   address: '7101 East Colfax Avenue, Denver, CO',
#   longitude: '-104.905731',
#   latitude: '39.740381',
#   open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
#   close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
#   hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
#   hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
#   message: 'Beer slushies!',
#   deals: '$1 off all drafts',
#   id_key: SecureRandom.hex(16)
# )

NAMES = ['Brothers Bar', "1UP", 'Oscar Blues', 'Fiction Brewery', 'Freshcraft', 'Thirsty Lion']
ADDRESS = ['1920 Market Street, Denver, CO', '1925 Blake Street, Denver, CO', '1624 Market Street, Denver, CO', '7101 East Colfax Avenue, Denver, CO', '1530 Blake Street, Denver, CO', '1605 Wynkoop Street, Denver, CO']
LONGITUDE = ['-104.994192', '-104.994983', '-104.997508', '-104.905731', '-104.999540', '-105.012380']
LATITUDE = ['39.753057', '39.753782', '39.750111', '39.740381', '39.749920', '39.745880']
OPEN = { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' }
CLOSE = { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' }
HHSTART = { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' }
HHEND = { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' }
MESSAGE = ['Come on our September 26nd for karaoke!', 'Free games on September 15th!', 'Live music on September 19th!', 'Beer slushies!']
DEALS = ['$1 off all drafts', 'All beers half off', 'All 40s $5', 'Fireball shots $4', 'Half price tequila shots', 'LIT pitchers $5', '$2 PBR', '$2 Bud Light Drafts', '$4 Mojitos', '$15 Lagunitas buckets', '$3 domestic drafts', '$3 wells', '$5 margaritas']

NAMES.each_with_index do |bar_name, i|
  Bar.create(
    name: bar_name,
    address: ADDRESS[i],
    longitude: LONGITUDE[i],
    latitude: LATITUDE[i],
    open: OPEN,
    close: CLOSE,
    hh_start: HHSTART,
    hh_end: HHEND,
    message: MESSAGE.sample,
    deals: DEALS.sample(5),
    id_key: SecureRandom.hex(16)
  )
end
