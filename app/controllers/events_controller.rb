class EventsController < ApplicationController
  
  

  def index
    # User's Location
    ap params[:user_location]
    @user_location = params[:user_location]
    
    location_api = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/search/locations.json?query=#{@user_location}&apikey=QG143a2Qf7zybpnb")
    puts "You're searching for #{@user_location}:".upcase
    # ap location_api
    # DISPLAYS JSON DATA LOCATION_ID!!!! WOOOOOO


    if location_api["resultsPage"]["totalEntries"] > 0
      @location_id = location_api["resultsPage"]["results"]["location"][0]["metroArea"]["id"]
      ap @location_id

      upcoming_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/metro_areas/#{@location_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
      # Displays all upcoming events for that location:
      @event_details = upcoming_events['resultsPage']['results']['event']


      if @location_id && @event_details != nil
        @event_venue_lat = @event_details[0]['venue']['lat']
        @event_venue_lng = @event_details[0]['venue']['lng']
        # puts "Event ID's for #{@user_location}:"
        # Create counter so I have an ID:
        counter = 0
        @event_details.each do |event|
          counter += 1
          event.merge!({'counter_id' => counter})
          event_json = JSON.generate event
          event_id = counter
          @location_performance_id = event['id']
          # ap event_json
          # ap event_id
          
          # If the event already exists in db,
          # don't create it (get it from API)
          # else 
          # search for it from the API.
          # end
          ap @location_performance_id


          if Event.where( location_performance_id: @location_performance_id ).length < 1
            Event.create({ location_performance_id: @location_performance_id, event_location: @user_location, event_json: event })
          end
        end

        @events = Event.where("event_location LIKE ?", "%#{params[:user_location]}%")
        # @events = Event.paginate(:page => params[:page], :per_page => 30)
      end
    end


    respond_to do |format|
      format.js
      format.html
    end
    # @event_details.paginate(:page => params[:page], :per_page => 10)
  
    # @events = Event.all
  end



  def show

    @event = Event.find params[:id]
    event_show_details = @event
    @event_artist = event_show_details['event_json']['performance'][0]['displayName']
    ap @event_artist

    event_artist_api = HTTParty.get URI.encode("https://api.spotify.com/v1/search?q=#{@event_artist}&type=artist")
    @event_artist_id = event_artist_api['artists']['items'][0].try(:[], 'id')
    ap @event_artist_id

    if @event_artist_id != nil
      event_artist_top_tracks = HTTParty.get URI.encode("https://api.spotify.com/v1/artists/#{@event_artist_id}/top-tracks?country=US")
      # ap event_artist_top_tracks
      @location_artist_top_tracks = event_artist_top_tracks["tracks"]

      @location_artist_genres = event_artist_api['artists']['items'][0]['genres']
      
      @location_artist_image = event_artist_api['artists']['items'][0]['images'][0].try(:[], 'url')

      if @location_artist_image != nil
        @location_artist_image = event_artist_api['artists']['items'][0]['images'][0]['url']
      end


      @location_related_artists = HTTParty.get URI.encode("https://api.spotify.com/v1/artists/#{@event_artist_id}/related-artists")
      
        @location_related_artists['artists'].each do |name|
          @event_related_artists = name['name']
        end
      
      
    end




  end
end