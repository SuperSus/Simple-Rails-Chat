# frozen_string_literal: true

class RoomMessagesController < ApplicationController
  before_action :set_room

  def create
    @room_message = RoomMessage.create(
      user: current_user,
      room: @room,
      message: params.dig(:room_message, :message)
    )

    RoomChannel.broadcast_to @room, @room_message
  end

  private

  def set_room
    @room = Room.find(params.dig(:room_message, :room_id))
  end
end
