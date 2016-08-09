# frozen_string_literal: true
require 'sendgrid/contact'

class ExternalContactService
  EXTERNAL_CONTACT = SendGrid::Contact

  def call(email:)
    EXTERNAL_CONTACT.create(email: email)
  end
end
