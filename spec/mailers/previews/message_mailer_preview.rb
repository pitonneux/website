# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/send_to_admin
  def send_to_admin
    MessageMailerMailer.send_to_admin
  end

end
