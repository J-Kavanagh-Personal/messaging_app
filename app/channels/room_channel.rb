class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "RoomChannel"
  end
end
