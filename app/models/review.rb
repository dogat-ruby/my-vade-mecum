class Review < ActiveRecord::Base
	belongs_to :book
	
	validates :user_id, :book_id, presence: true
	#validates :text, :user_id, :book_id, presence: true
end
