class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.send_to_admin.subject
  #
  def send_to_admin
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
