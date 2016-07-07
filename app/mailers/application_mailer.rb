# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: 'contact@pitonneux.com'
  layout 'mailer'
end

