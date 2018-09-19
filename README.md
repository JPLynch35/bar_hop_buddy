# BarHopBuddy

BarHopBuddy is an application that aims to help bar seeking patrons find the best happy hour deals around their location.  You simply log in, utilizing your Google account, and select the happy hour deals that interest you.  A map is then created showing your current location, along with the locations of all the bars you selected, limited to a half mile radius.  In addition, this application seeks to help bars improve their happy hour foot traffic by providing analytics showing their bar's performance in the app, allowing the bar to change their happy hour deals in to increase overall sales.

## Navigating the App  
The splash page will automatically redirect you to Google's OAuth server.  
<img width="1440" alt="screen shot 2018-09-18 at 8 52 57 pm" src="https://user-images.githubusercontent.com/32905782/45728547-a484a100-bb85-11e8-9ae9-197c22bf1a22.png">

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
