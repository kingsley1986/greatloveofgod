class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :post
  belongs_to :comment
  belongs_to :picturable, polymorphic: true
  belongs_to :page
  belongs_to :news
  belongs_to :home
  belongs_to :upcoming_event
  belongs_to :sermon
end
