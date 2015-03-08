class EventsController < ApplicationController
  location = []
  event_data = 'http://api.songkick.com/api/3.0/search/locations.json?query=#{location}&apikey=QG143a2Qf7zybpnb'

  def index
    @events = Event.all
  end

  



  def show
    @event = Event.find params[:id]
  end




end
