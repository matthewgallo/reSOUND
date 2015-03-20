# require 'rails_helper'

# describe EventsController do
#   let(:event) { Event.create({ location_performance_id: "1", event_location: "Charleston, SC", event_json: event }) }

#   describe "GET #index" do
#     it "should get a collection of upcoming events based on the given location" do
#         get :index
#         expect(assigns(:event)).not_to eq(nil)
#         expect(assigns(:event)).to eq([])
#     end
#   end


#   describe "GET #show" do
#     it 'should show a location event object' do
#       get :show, id: event
#       expect(assigns(:event).class).to eq event
#       expect(assigns(:event).new_record?).to eq(true)
#     end
#   end



# end