class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :email, presence: true
         validates :password, presence: true
         validates :password_confirmation, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :phone, presence: true
         validates :gender, presence: true

         has_many :posts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :replies, dependent: :destroy
         has_many :pictures, dependent: :destroy


    before_validation :params_sanitizer, only: :update

  def params_sanitizer
    if self.roles.to_s.include?("")
      self.roles.to_s.delete("")
    end
  end

  def self.roles_method
    ['pastor', 'assistant pastor']
  end
end
