# frozen_string_literal: true
require 'sendgrid-ruby'

module SendGrid
  class Contact
    class << self
      def create(email:)
        sendgrid.client.contactdb.recipients.post(request_body: format(email))
      end

      def sendgrid
        SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      end

      def format(email)
        [
          {
            "email": email,
          }
        ]
      end
    end
  end
end
