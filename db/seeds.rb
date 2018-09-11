# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bar.create(
  name: 'Brothers Bar',
  address: '1920 Market Street, Denver, CO',
  longitude: '-104.994192',
  latitude: '39.753057',
  open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
  close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
  hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
  hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
  message: 'Come on our September 26nd for karaoke!',
  deals: 'Budlight pitchers $5\nFireball shots $4',
  id_key: SecureRandom.hex(16)
)
Bar.create(
  name: '1UP',
  address: '1925 Blake Street, Denver, CO',
  longitude: '-104.994983',
  latitude: '39.753782',
  open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
  close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
  hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
  hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
  message: 'Free games on September 15th!',
  deals: 'All 40s $5\nFireball shots $4',
  id_key: SecureRandom.hex(16)
)
Bar.create(
  name: 'Oscar Blues',
  address: '1624 Market Street, Denver, CO',
  longitude: '-104.997508',
  latitude: '39.750111',
  open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
  close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
  hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
  hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
  message: 'Live music on September 19th!',
  deals: 'All beers half off!',
  id_key: SecureRandom.hex(16)
)
Bar.create(
  name: 'Fiction Brewery',
  address: '7101 East Colfax Avenue, Denver, CO',
  longitude: '-104.905731',
  latitude: '39.740381',
  open: { Sunday: '8am', Monday: '10am', Tuesday: '10am', Wednesday: '10am', Thursday: '10am', Friday: '10am', Saturday: '8am' },
  close: { Sunday: '10pm', Monday: '12am', Tuesday: '12am', Wednesday: '12am', Thursday: '12am', Friday: '2am', Saturday: '2am' },
  hh_start: { Sunday: '8am', Monday: '4pm', Tuesday: '4pm', Wednesday: '4pm', Thursday: '4pm', Friday: '4pm', Saturday: '4pm' },
  hh_end: { Sunday: '10pm', Monday: '6pm', Tuesday: '6pm', Wednesday: '6pm', Thursday: '6pm', Friday: '6pm', Saturday: '6pm' },
  message: 'Beer slushies!',
  deals: '$1 off all drafts',
  id_key: SecureRandom.hex(16)
)
