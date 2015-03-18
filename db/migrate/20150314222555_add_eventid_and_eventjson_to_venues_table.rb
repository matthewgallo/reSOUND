class AddEventidAndEventjsonToVenuesTable < ActiveRecord::Migration
  def change
    add_column :venues, :event_json, :longtext
    add_column :venues, :event_venue, :string
    add_column :venues, :venue_performance_id, :integer
  end
end
