# Bars
NAMES = ['Sisters Bar', "1DOWN", 'Oskar Greens', 'Truth Brewery', 'World of Freshcraft', 'Thirsty Lamb', 'Stan-Lee Beer House']
ADDRESS = ['1920 Market Street, Denver, CO', '1925 Blake Street, Denver, CO', '1624 Market Street, Denver, CO', '7101 East Colfax Avenue, Denver, CO', '1530 Blake Street, Denver, CO', '1605 Wynkoop Street, Denver, CO', '2501 Dallas Street, Aurora, CO']
LONGITUDE = ['-104.994192', '-104.994983', '-104.997508', '-104.905731', '-104.999540', '-105.0007', '-104.878220']
LATITUDE = ['39.753057', '39.753782', '39.750111', '39.740381', '39.749920', '39.752753', '39.752620']
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
    owner_email:  if i == 0
                      'JPLynch35@gmail.com'
                  else
                    'Bill2343241@gmail.com'
                  end
  )
end

# Users
(1..100).to_a.each do |num|
  User.create(uid: num.to_s, email: num.to_s + '@gmail.com')
end

#Choices and UserBars
created = [
  DateTime.now,
  DateTime.now-1.days,
  DateTime.now-2.days,
  DateTime.now-3.days,
  DateTime.now-4.days,
  DateTime.now-5.days,
  DateTime.now-6.days,
  DateTime.now-7.days
]
click = [true, false]
User.all.each do |user|
  Bar.all.each do |bar|
    choice = user.choices.create(click: click.sample, bar_id: bar.id, created_at: created.sample)
    user.user_bars.create(bar_id: bar.id) if choice.click == true
  end
end


