class MessageMailer < ActionMailer::Base
  default :to => "hthnsmusic@gmail.com"

  def new_message(message)
    @message = message
    mail(:from => message.email, :subject => message.subject)
  end
end