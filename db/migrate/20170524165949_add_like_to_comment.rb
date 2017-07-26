class AddLikeToComment < ActiveRecord::Migration
  def change
    add_column :comments, :like, :boolean, default: false
    add_column :comments, :liker_id, :jsonb, default: []
  end
end
