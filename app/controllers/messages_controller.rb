class MessagesController < ApplicationController

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    @message.user = current_user

    if @message.save
      SendMessageJob.perform_later(@message)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :user_id, :room_id)
    end
end
