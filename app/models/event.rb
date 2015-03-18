class Event < ActiveRecord::Base
  serialize :event_json, Hash
end












# module Songkick
#   class Event
#     include Mongoid::Document
#     include Mongoid::Timestamps
    
#     field :user_location, type: String
#     field :location_id, type: Integer
#   end
# end
