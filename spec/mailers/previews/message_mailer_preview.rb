# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message_mailer/send_to_admin
  def send_to_admin
    ENV['ADMIN_EMAIL']='test@pitonneux.com'
    message = FactoryGirl.create :message
    MessageMailer.send_to_admin(message)
  end
end
