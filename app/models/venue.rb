class Venue < ActiveRecord::Base
  serialize :event_json, Hash
end






# if venue_api["resultsPage"]["totalEntries"] > 0
#       @venue_id = venue_api["resultsPage"]["results"]["venue"][0]["id"]
#       ap @venue_id

#       venue_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/venues/#{@venue_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
#       @venue_event_details = venue_events["resultsPage"]["results"]["event"]

#       # Only if the venue has upcoming events.
#       if @venue_event_details != nil
#         @venue_lat = @venue_event_details[0]['venue']['lat']
#         @venue_lng = @venue_event_details[0]['venue']['lng']
#         # Create counter so I have an ID:
#         counter = 0
#         @venue_event_details.each do |event|
#           counter += 1
#           event.merge!({'counter_id' => counter})
#           event_json = JSON.generate event
#           event_id = counter
#           @venue_performance_id = event['id']
          

#           # If the event already exists in db,
#           # don't create it (get it from API)
#           # else 
#           # search for it from the API.
#           # end

#           if Venue.where( venue_performance_id: @venue_performance_id ).length < 1
#             Venue.create({ venue_performance_id: @venue_performance_id, event_venue: @venue_name, event_json: event })
#           end
#         end
#         @venues = Venue.where("event_venue LIKE ?", "%#{params[:venue_name]}%")
        
#         # @venues = Venue.paginate(:page => params[:page], :per_page => 20)
#       end
#     end




# module Songkick
#   class Venue
#     include Mongoid::Document
#     include Mongoid::Timestamps
    
#     field :venue_name, type: String
#     field :venue_id, type: Integer
#   end
# end
