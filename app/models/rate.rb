class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true

  #attr_accessible :rate, :dimension
  after_create :send_notification


  def send_notification
		receivers=self.rateable.followers.push self.rater
		# Notifications.review_notification(self.book,self.reviewer).deliver
    receivers.reject { |receiver|  receiver.settings.email_type=="digest"}
		receivers.each do |receiver|
			Notifications.delay.review_notification(self.rateable,receiver)
		end
	end
end
