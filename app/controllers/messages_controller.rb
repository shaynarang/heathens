class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      notice = "Thank you for contacting us. We will be in touch."
      section = "home/landing"
    else
      section = "home/contact"
    end

    respond_to do |format|
      flash[:notice] = notice if notice
      format.js { render "create", :locals => { section: section } }
    end
  end
end
