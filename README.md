# BarHopBuddy

BarHopBuddy is a proof on ceoncept application that aims to help bar seeking patrons find the best happy hour deals around their location.  You simply log in, utilizing your Google account, and select the happy hour deals that interest you.  A map is then created showing your current location, along with the locations of all the bars you selected, limited to a half mile radius.  In addition, this application seeks to help bars improve their happy hour foot traffic by providing analytics showing their bar's performance in the app, allowing the bar to change their happy hour deals in order to increase overall sales.  The application will require a monthly cost for bars, and is free to use for patrons.

## Navigating the App  
The splash page will automatically redirect you to Google's OAuth server after 3 seconds.  
<img width="1440" alt="screen shot 2018-09-18 at 8 52 57 pm" src="https://user-images.githubusercontent.com/32905782/45728547-a484a100-bb85-11e8-9ae9-197c22bf1a22.png">

Once on the deals page, your location will be found utilizing HTML5 geolocation.  This location will be shown on above the happy hour cards after it is retrieved.  After this is completed, it will show the happy hour cards for bars participating in the app.  Each bar can post a personal message and up to 5 happy hour deals.  The user then selects 'yes' or 'no' on the card, shown as a checkmark and an X. 
<img width="1440" alt="screen shot 2018-09-18 at 8 53 04 pm" src="https://user-images.githubusercontent.com/32905782/45728763-b3b81e80-bb86-11e8-964f-b744ad3a0c19.png">

Once complete, the user then selects 'Find Your Bars' to go to the map page. This map allows the user to see the bars they have selected, and each icon can be clicked on to show the bar information.



## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

This application was created in Rails v5.1.6, utilizing Ruby v2.4.1. 

### Installing

Clone the project down locally to your machine.  
```
git clone https://github.com/JPLynch35/bar_hop_buddy.git
```  
Inside the project directory, prepare the gems for development with bundler.  
```
bundle install
``` 

## Running the tests

This application is tested with RSpec.  In order to run this test suite, simply call upon RSpec in the terminal while in the project folder.  
```
rspec
```

## Built With

* Ruby 2.4.1- The code language
* Rails 5.1.6- Ruby's web framework
* Semantic UI- Front end framework for styling
* jQuery- JavaScript library
* OmniAuth Google OAuth2- Logging in utilizing a Google account
* MapBox- API for reverse geolocation and creating maps
* Chart.js- API for creating charts
* NewRelic- Performance analytics

## Authors

* **JP Lynch**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
