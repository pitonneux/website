# frozen_string_literal: true
class MessageMailer < ApplicationMailer
  def send_to_admin(message)
    @content = message.content
    @sender = message.sender

    mail send_to_admin_attributes
  end

  private

  def send_to_admin_attributes
    {
      from: 'Contact Form <contact@pitonneux.com>',
      to: ENV['ADMIN_EMAIL'],
      subject: t('.subject', name: @sender)
    }
  end
end
