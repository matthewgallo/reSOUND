class EventsController < ApplicationController
  
  

  def index
    # User's Location
    p params[:user_location]
    user_location = params[:user_location]
    
    location_api = HTTParty.get "http://api.songkick.com/api/3.0/search/locations.json?query=#{user_location}&apikey=QG143a2Qf7zybpnb"
    puts "You're searching for #{user_location}:".upcase
    # DISPLAYS JSON DATA!!!! WOOOOOO
    puts location_api

    # location_id = location_api['resultsPage']['results']['location'['metroArea']['id'].to_s]
    # p location_id


    # upcoming_events = HTTParty.get "http://api.songkick.com/api/3.0/metro_areas/#{location_id}/calendar.json?apikey=QG143a2Qf7zybpnb"
    
    # puts "Displaying upcoming events JSON:".upcase
    # puts upcoming_events
    


    
  
    @events = Event.all
    
    
    
    
  end

  



  def show
    @event = Event.find params[:id]
  end




end