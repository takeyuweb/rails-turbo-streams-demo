class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.order(created_at: :desc)
  end

  def create
    @message = Message.new(params.require(:message).permit(:body))
    if @message.save
      redirect_to messages_url
    else
      @messages = Message.order(created_at: :desc)
      render action: :index, status: :unprocessable_entity
    end
  end
end
