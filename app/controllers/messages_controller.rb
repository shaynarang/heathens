class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @random_image_url = Image.random.content.large.url
    @message = Message.new(params[:message])
    section = "home/contact"
    if @message.valid?
      MessageMailer.new_message(@message).deliver
      notice = "Thank you for contacting us. We will be in touch."
    else
      notice = nil
    end

    flash[:notice] = notice if notice

    respond_to do |format|
      format.js { render "create", :locals => { section: section } }
    end
  end
end
