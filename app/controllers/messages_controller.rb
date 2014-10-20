class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      redirect_to root_url, notice: "Thank you for contacting me. I will be in touch."
    else
      error_message = @message.errors.full_messages.to_sentence.downcase.capitalize
      redirect_to contact_path, notice: error_message + "!"
    end
  end
end
