class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = ApplicationController.render(MessageComponent.new(message: message, user: message.user))

    ActionCable.server.broadcast "RoomChannel", { html: html }
  end
end
