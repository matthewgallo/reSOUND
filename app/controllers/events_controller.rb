class EventsController < ApplicationController
  
  # location = [location that user inputs on home page, example Los Angeles, CA]
  

  def index
    # CITY
    # location_id_data = 'http://api.songkick.com/api/3.0/search/locations.json?query=#{location}&apikey=QG143a2Qf7zybpnb'
  
    # location_events = 'http://api.songkick.com/api/3.0/metro_areas/30717/calendar.json?apikey=QG143a2Qf7zybpnb'
  
    @events = Event.all
    params [:location]
  end

  



  def show
    @event = Event.find params[:id]
  end




end


# def index 
  # params [:location]
  # query API
  # Event.query_stuff()
# end