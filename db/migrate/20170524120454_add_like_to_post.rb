class AddLikeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :like, :boolean, default: false
    add_column :posts, :liker_id, :jsonb, default: []
  end
end
