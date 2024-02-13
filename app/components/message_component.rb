# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  def initialize(message:, user:)
    @message = message
    @user = user
  end

end
