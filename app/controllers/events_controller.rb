class EventsController < ApplicationController
  
  

  def index
    # User's Location
    p params[:user_location]
    @user_location = params[:user_location]
    
    location_api = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/search/locations.json?query=#{@user_location}&apikey=QG143a2Qf7zybpnb")
    puts "You're searching for #{@user_location}:".upcase
    
    # DISPLAYS JSON DATA LOCATION_ID!!!! WOOOOOO
    location_id = location_api["resultsPage"]["results"]["location"][0]["metroArea"]["id"]
    ap location_id

    upcoming_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/metro_areas/#{location_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
    # Displays all upcoming events for that location:
    @event_details = upcoming_events['resultsPage']['results']['event']
    
    puts "Event ID's for #{@user_location}:"
    # Create counter so I have an ID:
    counter = 0
    @event_details.each do |event|
      counter += 1
      event.merge!({'counter_id' => counter})
      event_json = JSON.generate event
      event_id = counter
      ap event_json
      ap event_id
    end

    respond_to do |format|
      format.js
      format.html
    end
    # @event_details.paginate(:page => params[:page], :per_page => 10)
  
    # @events = Event.all
  end

  



  def show
    # @events = upcoming_events['resultsPage']['results']['event']

    # @events.select{|obj| obj.id == params[:id]}

    artist_name = @event_details['performance'][0]['displayName']
    artist_api = HTTParty.get "https://api.spotify.com/v1/search?q=#{artist_name}&type=artist"
    artist_id = artist_api['artists']['items'][0]['id']
    ap artist_id
    artist_name = artist_api['artists']['items'][0]['name']
    ap artist_name
    artist_image = artist_api['artists']['items'][0]['images'][0]
    ap artist_image

    @event = Event.find params[:id]
  end
end