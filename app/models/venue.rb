class Venue < ActiveRecord::Base
  serialize :event_json, Hash
end











# module Songkick
#   class Venue
#     include Mongoid::Document
#     include Mongoid::Timestamps
    
#     field :venue_name, type: String
#     field :venue_id, type: Integer
#   end
# end
