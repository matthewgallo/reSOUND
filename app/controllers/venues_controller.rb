class VenuesController < ApplicationController
  def index

    p params[:venue_name]
    @venue_name = params[:venue_name]

    venue_api = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/search/venues.json?query=#{@venue_name}&apikey=QG143a2Qf7zybpnb")
    puts "You're searching for #{@venue_name}:".upcase

    # DISPLAYS JSON DATA VENUE ID!!!!!
    venue_id = venue_api["resultsPage"]["results"]["venue"][0]["id"]
    ap venue_id

    venue_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/venues/#{venue_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
    @venue_event_details = venue_events["resultsPage"]["results"]["event"]


    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end
end
