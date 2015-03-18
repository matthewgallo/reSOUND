class Artist < ActiveRecord::Base
  serialize :event_json, Hash
end
























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