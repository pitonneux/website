# frozen_string_literal: true
class Message < ActiveRecord::Base
  after_commit :set_email_recipient

  validates_presence_of :sender
  validates_presence_of :content
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_one :email_recipient, dependent: :destroy, as: :collectible

  def set_email_recipient
    self.email_recipient = EmailRecipient.find_or_create_by(email: email)
  end
end
