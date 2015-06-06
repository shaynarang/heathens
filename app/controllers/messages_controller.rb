class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    MessageMailer.new_message(@message).deliver if @message.valid?
  end
end
