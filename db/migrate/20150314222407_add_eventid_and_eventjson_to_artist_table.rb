class AddEventidAndEventjsonToArtistTable < ActiveRecord::Migration
  def change
    add_column :artists, :event_json, :text
    add_column :artists, :event_id, :integer
  end
end
