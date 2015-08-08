class Review < ActiveRecord::Base
	belongs_to :book
	belongs_to :reviewer,class_name: "User",foreign_key: :user_id
	validates :user_id, :book_id,:text, presence: true
	#callbacks
	after_create :send_notification
	#validates :text, :user_id, :book_id, presence: true
	def send_notification
		receivers=self.book.followers.push self.reviewer
		receivers.reject { |receiver|  receiver.settings.email_type=="digest"}
		receivers.each do |receiver|
			Notifications.delay.review_notification(self.book,receiver)
		end
	end
end
