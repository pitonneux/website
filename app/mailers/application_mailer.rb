# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: 'Les Pitonneux <contact@pitonneux.com>'
  layout 'mailer'
end
