class AddGoingToUpcomingEvent < ActiveRecord::Migration
  def change
    add_column :upcoming_events, :going, :jsonb, default: []
  end
end
