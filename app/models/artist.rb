class Artist < ActiveRecord::Base
  serialize :event_json, Hash
end












# if artist_api['resultsPage']['totalEntries'] > 0
#       @artist_id = artist_api["resultsPage"]["results"]["artist"][0]["id"]
#       ap @artist_id

#       artist_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/artists/#{@artist_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
    
#       @artist_event_details = artist_events["resultsPage"]["results"]["event"]
    
#       # ap @artist_event_details

    
#       # If the artist has upcoming events do all this stuff.
#       if @artist_id && @artist_event_details != nil
#         @artist_venue_lat = @artist_event_details[0]['venue']['lat']
#         @artist_venue_lng = @artist_event_details[0]['venue']['lng']
      
#         # Create counter so I have an ID:
#         counter = 0
#         @artist_event_details.each do |event|
#           counter += 1
#           event.merge!({'counter_id' => counter})
#           event_json = JSON.generate event
#           event_id = counter
#           @artist_performance_id = event['id']
#           # ap event_json
#           # ap event_id
#           # If the event already exists in db,
#           # don't create it, use what is already in the db
#           # else 
#           # search for it from the API.
#           # end

#             ap @artist_performance_id
          
#             if Artist.where(artist_performance_id: @artist_performance_id).length < 1
#               Artist.create({ artist_performance_id: @artist_performance_id, event_artist: @artist_name, event_json: event })
#             end 
#         end
#         @artists = Artist.where("event_artist LIKE ?", "%#{params[:artist_name]}%")
#       end
#     end











# module Songkick
#     class Artist
#         include Mongoid::Document
#         include Mongoid::Timestamps
        
#         field :artist_name, type: String
#         field :artist_id, type: Integer
#     end
# end

# # Put this in controller.
# location = Songkick::LocationQuery.find_or_initialize_by(user_location: query_string) do |location|
#     # get your api response
#     location.location_id = api_response.location
#     location.save
# end