class Post < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, as: :picturable, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :pictures, :reject_if => proc { |attributes| attributes['image'].blank? }
  accepts_nested_attributes_for :comments
  validates :title, presence: true
  validates :post_body, presence: true

end
