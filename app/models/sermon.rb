class Sermon < ActiveRecord::Base
  has_many :pictures, as: :picturable, dependent: :destroy
  has_many :sermonreviews, dependent: :destroy
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }

end
