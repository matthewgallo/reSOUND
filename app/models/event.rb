class Event < ActiveRecord::Base
  serialize :event_json, Hash





  # def only_if_location_exist
  #   if location_api["resultsPage"]["totalEntries"] > 0
  #     @location_id = location_api["resultsPage"]["results"]["location"][0]["metroArea"]["id"]
  #     ap @location_id

  #     upcoming_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/metro_areas/#{@location_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
  #     # Displays all upcoming events for that location:
  #     @event_details = upcoming_events['resultsPage']['results']['event']


  #     if @location_id && @event_details != nil
  #       @event_venue_lat = @event_details[0]['venue']['lat']
  #       @event_venue_lng = @event_details[0]['venue']['lng']
  #       # puts "Event ID's for #{@user_location}:"
  #       # Create counter so I have an ID:
  #       counter = 0
  #       @event_details.each do |event|
  #         counter += 1
  #         event.merge!({'counter_id' => counter})
  #         event_json = JSON.generate event
  #         event_id = counter
  #         @location_performance_id = event['id']
  #         # ap event_json
  #         # ap event_id
          
  #         # If the event already exists in db,
  #         # don't create it (get it from API)
  #         # else 
  #         # search for it from the API.
  #         # end
  #         ap @location_performance_id


  #         if Event.where( location_performance_id: @location_performance_id ).length < 1
  #           Event.create({ location_performance_id: @location_performance_id, event_location: @user_location, event_json: event })
  #         end
  #       end

  #       @events = Event.where("event_location LIKE ?", "%#{params[:user_location]}%")
  #       # @events = Event.paginate(:page => params[:page], :per_page => 30)
  #     end
  #   end
  # end
end












# module Songkick
#   class Event
#     include Mongoid::Document
#     include Mongoid::Timestamps
    
#     field :user_location, type: String
#     field :location_id, type: Integer
#   end
# end
