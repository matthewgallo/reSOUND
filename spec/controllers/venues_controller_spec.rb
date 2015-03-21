require "rails_helper"

describe VenuesController do
  let(:venue) { Venue.create({ venue_name: "Madison Square Garden", venue_performance_id: "1", event_json: @venue_event_details }) }
end