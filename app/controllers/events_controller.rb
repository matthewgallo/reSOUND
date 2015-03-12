class EventsController < ApplicationController
  
  

  def index
    # User's Location
    p params[:user_location]
    user_location = params[:user_location]
    
    location_api = HTTParty.get "http://api.songkick.com/api/3.0/search/locations.json?query=#{user_location}&apikey=QG143a2Qf7zybpnb"
    puts "You're searching for #{user_location}:".upcase
    # DISPLAYS JSON DATA LOCATION_ID!!!! WOOOOOO
    location_id = location_api["resultsPage"]["results"]["location"][0]["metroArea"]["id"]
    ap location_id

    upcoming_events = HTTParty.get "http://api.songkick.com/api/3.0/metro_areas/#{location_id}/calendar.json?apikey=QG143a2Qf7zybpnb"
    
    
    # Displays all upcoming events for that location:
    puts "Display all the event details I want from JSON".upcase
    @event_details = upcoming_events['resultsPage']['results']['event']
    # @upcoming_events = event_details
    # redirect_to events_path


    @event_details.each do |event|
      event['performance'].each do |performance| 
       ap performance['displayName']
      end
      ap event['venue']['displayName']
      ap event['location']['city']
      ap event['displayName']
      ap event['start']['date']
    end
    # ap @event_details
    
  
    @events = Event.all
    
    
    
    
  end

  



  def show
    @event = Event.find params[:id]
  end




end