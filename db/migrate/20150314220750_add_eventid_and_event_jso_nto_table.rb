class AddEventidAndEventJsoNtoTable < ActiveRecord::Migration
  def change
    add_column :events, :event_json, :longtext
    add_column :events, :event_location, :string
    add_column :events, :location_performance_id, :integer
  end
end
