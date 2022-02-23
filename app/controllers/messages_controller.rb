class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.order(created_at: :desc)
  end

  def create
    @message = Message.new(params.require(:message).permit(:body))
    respond_to do |format|
      if @message.save
        # Broadcast to the "messages_channel" channel (asynchronous)
        @message.broadcast_prepend_later_to("messages_channel")

        format.html { redirect_to messages_url }
        format.turbo_stream
      else
        @messages = Message.order(created_at: :desc)
        format.html { render action: :index, status: :unprocessable_entity }
      end
    end
  end
end
