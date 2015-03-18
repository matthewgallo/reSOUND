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
    @event_venue_lat = @event_details[0]['venue']['lat']
    @event_venue_lng = @event_details[0]['venue']['lng']
    # puts "Event ID's for #{@user_location}:"
    # Create counter so I have an ID:
    counter = 0
    @event_details.each do |event|
      counter += 1
      event.merge!({'counter_id' => counter})
      event_json = JSON.generate event
      event_id = counter
      @location_performance_id = event['id']
      # ap event_json
      # ap event_id
      
      # If the event already exists in db,
      # don't create it (get it from API)
      # else 
      # search for it from the API.
      # end
      ap @location_performance_id



      Event.create({ location_performance_id: @location_performance_id, event_location: @user_location, event_json: event })
    end
    @events = Event.where("event_location LIKE ?", "%#{params[:user_location]}%")
    # @events = Event.paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
      format.js
      format.html
    end
    # @event_details.paginate(:page => params[:page], :per_page => 10)
  
    # @events = Event.all
  end

  def new
  end



  def show
    # @event_show = JSON.parse(@event_details)
    @event = Event.find params[:id]
    # ap event_show
    # @events = upcoming_events['resultsPage']['results']['event']

    # @events.select{|obj| obj.id == params[:id]}

    # artist_name = @event_details['performance'][0]['displayName']
    # artist_api = HTTParty.get "https://api.spotify.com/v1/search?q=#{artist_name}&type=artist"
    # artist_id = artist_api['artists']['items'][0]['id']
    # ap artist_id
    # artist_name = artist_api['artists']['items'][0]['name']
    # ap artist_name
    # artist_image = artist_api['artists']['items'][0]['images'][0]
    # ap artist_image

    # @event = Event.find params[:counter_id]
  end
end