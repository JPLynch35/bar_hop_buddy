class MapService
  def initialize(long, lat)
    @long = long
    @lat = lat
  end

  def call_current_address
    @map ||= get_json("/geocoding/v5/mapbox.places/#{long},#{lat}.json?types=address&access_token=pk.eyJ1IjoianBseW5jaDM1IiwiYSI6ImNqbHIyczB1NjAwbDczcXMzN3Vra2RsNGwifQ.-BxRMCzfhhmbT8lA-qYqcQ")
  end

  def converted_address
    call_current_address[:features].first[:address] + ' ' + 
    call_current_address[:features].first[:text] + ' ' + 
    call_current_address[:features].first[:context].second[:text] + ', ' + 
    call_current_address[:features].first[:context].third[:text]
  end

  private
  attr_reader :long, :lat
  
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.mapbox.com')
  end
end
