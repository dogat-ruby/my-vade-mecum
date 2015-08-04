# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications/review_notification
  def review_notification
    Notifications.review_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications/follow_notification
  def follow_notification
    Notifications.follow_notification
  end

end
