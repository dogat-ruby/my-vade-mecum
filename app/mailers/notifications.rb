class Notifications < ActionMailer::Base
  default from: "Notifier <mailgun@sandbox3f7791fc9de44534a9d46f1930552cf5.mailgun.org>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.review_notification.subject
  #
  def review_notification(book,user)
    @greeting = "Hi"
    @book=book
    @user=user
    mail to: user.email
  end
  def rate_notification(book,user)
    @greeting = "Hi"
    @book=book
    @user=user
    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.follow_notification.subject
  #
  def follow_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
