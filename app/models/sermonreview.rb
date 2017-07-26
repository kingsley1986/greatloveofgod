class Sermonreview < ActiveRecord::Base
  belongs_to :sermon

  validates :name, presence: true
  validates :body, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }


  before_validation :params_sanitizer, only: :update

  def params_sanitizer
    if self[:review_approve].include?("")
      self.review_approve.delete("")
    end
  end

  def self.approver
    ['rejected', 'decisioning', 'approved']
  end
end
