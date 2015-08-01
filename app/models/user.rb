class User < ActiveRecord::Base
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
  :trackable, :validatable, :confirmable
  # associations
  has_many :books
  has_many :reviews, dependent: :destroy
  # acts_as_x
   acts_as_follower
end
