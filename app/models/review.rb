class Review < ActiveRecord::Base
	belongs_to :book
	belongs_to :reviewer,class_name: "User",foreign_key: :user_id
	validates :user_id, :book_id,:text, presence: true
	#validates :text, :user_id, :book_id, presence: true
end
