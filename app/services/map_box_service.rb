class MapBoxService
  def initialize(long, lat)
    @long = long
    @lat = lat
  end

  def call_current_address
    @location ||= get_json("/geocoding/v5/mapbox.places/#{long},#{lat}.json?types=address&access_token=#{ENV['MAPBOX_PK']}")
  end

  def converted_address
    call_current_address[:features].first[:address] + ' ' + 
    call_current_address[:features].first[:text] + ' ' + 
    call_current_address[:features].first[:context].second[:text] + ', ' + 
    call_current_address[:features].first[:context].third[:text]
  end

  private
  attr_reader :long, :lat
  
  def get_png(url)
    conn.get(url).body
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.mapbox.com')
  end
end
