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

    # Create counter so I have an ID:
    counter = 0
    @venue_event_details.each do |event|
      counter += 1
      event.merge!({'counter_id' => counter})
      event_json = JSON.generate event
      event_id = counter
      ap event_json
      ap event_id
      # ap event
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end
end
