# frozen_string_literal: true
class MessagesController < ApplicationController
  def index
    authenticate_user!
    authorize Message
    @messages = Message.all
  end

  def create
    @message = Message.create(message_params)
    respond_to :js

    if @message.save
      render 'success'
      MessageMailer.send_to_admin(@message).deliver_later
    else
      render 'fail'
    end
  end

  private

  def message_params
    params.require(:message).permit(:sender, :email, :content)
  end
end
