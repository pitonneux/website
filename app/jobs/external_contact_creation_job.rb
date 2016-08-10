require 'sendgrid/contact'

class ExternalContactCreationJob < ApplicationJob
  queue_as :default

  EXTERNAL_CONTACT = SendGrid::Contact

  def perform(email:)
    EXTERNAL_CONTACT.create(email: email)
  end
end
