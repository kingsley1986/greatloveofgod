class AddSermonDateToSermon < ActiveRecord::Migration
  def change
    add_column :sermons, :sermondate, :date
  end
end
