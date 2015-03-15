class AddEventidAndEventjsonToVenuesTable < ActiveRecord::Migration
  def change
    add_column :venues, :event_json, :text
    add_column :venues, :event_id, :integer
  end
end
