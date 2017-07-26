class AddReviewApprovedToSermonreview < ActiveRecord::Migration
  def change
    add_column :sermonreviews, :review_approve, :jsonb, default: []
  end
end
