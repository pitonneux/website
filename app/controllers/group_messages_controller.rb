class GroupMessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    authorize GroupMessage
    @group_message = GroupMessage.new
    @recipients = EmailRecipient.all
  end

  def create
    authorize GroupMessage
    @group_message = GroupMessage.new(group_message_params)

    if @group_message.save

      redirect_to group_messages_path, notice: t('.success')
    else
      flash[:alert] = t('.failure')
      render :new
    end
  end

  private

  def group_message_params
    params.require(:group_message).permit(:message)
  end
end
