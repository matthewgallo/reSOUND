class AddEventidAndEventJsoNtoTable < ActiveRecord::Migration
  def change
    add_column :events, :event_json, :text
    add_column :events, :event_id, :integer
  end
end
