class AddEventidAndEventjsonToArtistTable < ActiveRecord::Migration
  def change
    add_column :artists, :event_json, :longtext
    add_column :artists, :event_artist, :string
    add_column :artists, :artist_performance_id, :integer
  end
end
