require 'rails_helper'

describe ArtistsController do
  let(:artist) { Artist.create({ artist_name: "Branford Marsalis", artist_performance_id: "1", event_json: @artist_event_details }) }
end