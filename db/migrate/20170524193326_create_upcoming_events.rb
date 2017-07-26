class CreateUpcomingEvents < ActiveRecord::Migration
  def change
    create_table :upcoming_events do |t|
      t.string :title
      t.string :body
      t.datetime :starting_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
