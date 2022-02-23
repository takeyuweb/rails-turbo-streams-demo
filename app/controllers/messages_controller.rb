class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.order(created_at: :desc)
  end

  def create
    @message = Message.new(params.require(:message).permit(:body))
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url }
        format.turbo_stream
      else
        @messages = Message.order(created_at: :desc)
        format.html { render action: :index, status: :unprocessable_entity }
      end
    end
  end
end
