class ArtistsController < ApplicationController
  def index
    # Artist Name Search
    p params[:artist_name]
    @artist_name = params[:artist_name]

    artist_api = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/search/artists.json?query=#{@artist_name}&apikey=QG143a2Qf7zybpnb")
    puts "You're searching for #{@artist_name}:".upcase

    # DISPLAYS JSON DATA ARTIST_ID!!!! WOOOOOO
    artist_id = artist_api["resultsPage"]["results"]["artist"][0]["id"]
    ap artist_id

    artist_events = HTTParty.get URI.encode("http://api.songkick.com/api/3.0/artists/#{artist_id}/calendar.json?apikey=QG143a2Qf7zybpnb")
    @artist_event_details = artist_events["resultsPage"]["results"]["event"]

    respond_to do |format|
      format.js
      format.html
    end

    # @artists = Artist.all


  end



  def show
  end
end
