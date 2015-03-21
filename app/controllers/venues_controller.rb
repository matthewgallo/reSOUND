class VenuesController < ApplicationController
  def index

    p params[:venue_name]
    @venue_name = params[:venue_name]

    venue_api = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/search/venues.json?query=#{@venue_name}&apikey=QG143a2Qf7zybpnb")
    puts "You're searching for #{@venue_name}:".upcase

    # DISPLAYS JSON DATA VENUE ID!!!!!
    # Only if the venue exists in the songkick api database.
    if venue_api["resultsPage"]["totalEntries"] > 0
      @venue_id = venue_api["resultsPage"]["results"]["venue"][0]["id"]
      ap @venue_id

      venue_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/venues/#{@venue_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
      @venue_event_details = venue_events["resultsPage"]["results"]["event"]

      # Only if the venue has upcoming events.
      if @venue_event_details != nil
        @venue_lat = @venue_event_details[0]['venue']['lat']
        @venue_lng = @venue_event_details[0]['venue']['lng']
        # Create counter so I have an ID:
        counter = 0
        @venue_event_details.each do |event|
          counter += 1
          event.merge!({'counter_id' => counter})
          event_json = JSON.generate event
          event_id = counter
          @venue_performance_id = event['id']
          

          # If the event already exists in db,
          # don't create it (get it from API)
          # else 
          # search for it from the API.
          # end

          if Venue.where( venue_performance_id: @venue_performance_id ).length < 1
            Venue.create({ venue_performance_id: @venue_performance_id, event_venue: @venue_name, event_json: event })
          end
        end
        @venues = Venue.where("event_venue LIKE ?", "%#{params[:venue_name]}%")
        
        # @venues = Venue.paginate(:page => params[:page], :per_page => 20)
      end
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @venue = Venue.find params[:id]
    @venue_event_time = @venue.event_json['start']['time']

    venue_show_details = @venue
    @venue_artist = venue_show_details['event_json']['performance'][0]['displayName']

    ap @venue_artist

    @venue_artist_api = HTTParty.get URI.encode("https://api.spotify.com/v1/search?q=#{@venue_artist}&type=artist")
    @venue_artist_id = @venue_artist_api['artists']['items'][0].try(:[], 'id')
    ap @venue_artist_id
      # Only if the artist has spotify info.
      if @venue_artist_id != nil
        venue_artist_top_tracks_api = HTTParty.get URI.encode("https://api.spotify.com/v1/artists/#{@venue_artist_id}/top-tracks?country=US")
        @venue_artist_top_tracks = venue_artist_top_tracks_api['tracks']

        @venue_artist_genres = @venue_artist_api['artists']['items'][0]['genres']

        
        @venue_artist_image = @venue_artist_api['artists']['items'][0]['images'][0].try(:[], 'url')
        if @venue_artist_image != nil
        @venue_artist_image = @venue_artist_api['artists']['items'][0]['images'][0]['url']
        end

        @venue_related_artists_search = HTTParty.get URI.encode("https://api.spotify.com/v1/artists/#{@venue_artist_id}/related-artists")
        @venue_related_artists_search['artists'].each do |name|
          @venue_related_artists = name['name']
        end
      end

  end
end
