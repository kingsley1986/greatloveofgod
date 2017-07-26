class AddComingwithToUpcomingEvent < ActiveRecord::Migration
  def change
    add_column :upcoming_events, :coming_with, :jsonb, default: []
  end
end
