class ArtistsController < ApplicationController
  def index
    # Artist Name Search
    p params[:artist_name]
    @artist_name = params[:artist_name]

    artist_api = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/search/artists.json?query=#{@artist_name}&apikey=QG143a2Qf7zybpnb")
    puts "You're searching for #{@artist_name}:".upcase

    # DISPLAYS JSON DATA ARTIST_ID!!!! WOOOOOO
    if artist_api['resultsPage']['totalEntries'] > 0
      @artist_id = artist_api["resultsPage"]["results"]["artist"][0]["id"]
      ap @artist_id

      artist_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/artists/#{@artist_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
    
      @artist_event_details = artist_events["resultsPage"]["results"]["event"]
    
      # ap @artist_event_details

    
      # If the artist has upcoming events do all this stuff.
      if @artist_id && @artist_event_details != nil
        @artist_venue_lat = @artist_event_details[0]['venue']['lat']
        @artist_venue_lng = @artist_event_details[0]['venue']['lng']
      
        # Create counter so I have an ID:
        counter = 0
        @artist_event_details.each do |event|
          counter += 1
          event.merge!({'counter_id' => counter})
          event_json = JSON.generate event
          event_id = counter
          @artist_performance_id = event['id']
          # ap event_json
          # ap event_id
          # If the event already exists in db,
          # don't create it, use what is already in the db
          # else 
          # search for it from the API.
          # end

            ap @artist_performance_id
          
            if Artist.where(artist_performance_id: @artist_performance_id).length < 1
              Artist.create({ artist_performance_id: @artist_performance_id, event_artist: @artist_name, event_json: event })
            end 
        end
        @artists = Artist.where("event_artist LIKE ?", "%#{params[:artist_name]}%")
      end
    end
    # @artists = Artist.paginate(:page => params[:page], :per_page => 20)


    respond_to do |format|
      format.js
      format.html
    end
  end



  def show
    # ap params[:artist_name]
    @artist = Artist.find params[:id]


    spotify_artist_api = HTTParty.get URI.encode("https://api.spotify.com/v1/search?q=#{@artist.event_artist}&type=artist")
    # ap spotify_artist_api
    # IT'S WORKINGGGGGGGGG!!!!!!!!!!!!!!
    
    @spotify_artist_id = spotify_artist_api["artists"]["items"][0].try(:[], "id")
    # ap @spotify_artist_id

    if @spotify_artist_id != nil
      top_tracks = HTTParty.get URI.encode("https://api.spotify.com/v1/artists/#{@spotify_artist_id}/top-tracks?country=US")
      
      # ap top_tracks
      @artist_top_tracks = top_tracks["tracks"]



      # Related Artists
      @spotify_related_artists_api = HTTParty.get URI.encode("https://api.spotify.com/v1/artists/#{@spotify_artist_id}/related-artists")

      if @spotify_related_artists_api.length > 0
        @artist_related_artists = @spotify_related_artists_api
      end

      # Artist bio
        @artist_bio_api = HTTParty.get URI.encode("http://developer.echonest.com/api/v4/artist/biographies?api_key=NHTNIAJPP3USAIFB6&id=spotify:artist:#{@spotify_artist_id}&format=json")
        if @artist_bio_api.length > 0
          
         @resound_artist_bio = @artist_bio_api['response']['biographies'].try(:[], 0).try(:[], 'text')
         @resound_artist_bio_url = @artist_bio_api['response']['biographies'].try(:[], 0).try(:[], 'url')
         
          
        end



      @artist_spotify_image = spotify_artist_api['artists']['items'][0]['images'][0].try(:[], "url")
      # ap @related_artists
      if @artist_spotify_image != nil
        @artist_spotify_image = spotify_artist_api['artists']['items'][0]['images'][0]["url"]
      end
      @artist_genres = spotify_artist_api['artists']['items'][0]['genres']
    end

    respond_to do |format|
      format.js
      format.html
    end
  end
end