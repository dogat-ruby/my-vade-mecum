class User < ActiveRecord::Base
  include RailsSettings::Extend
  ratyrate_rater
  audited
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable,
  :trackable, :validatable
  # , :confirmable
  # associations
  has_many :books
  has_many :reviews, dependent: :destroy
  # acts_as_x
  acts_as_follower
  #scopes
  scope :blocked, -> { where(is_blocked: true)  }
   def block
     self.is_blocked=true
     self.save
   end
   def unblock
     self.is_blocked=false
     self.save
   end
   def name
     username || email
   end
end
