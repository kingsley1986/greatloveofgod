class AddApprovedToComment < ActiveRecord::Migration
  def change
    add_column :comments, :approved, :jsonb, default: []
  end
end
