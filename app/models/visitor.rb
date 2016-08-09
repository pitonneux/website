# frozen_string_literal: true
class Visitor < ApplicationRecord
  after_create_commit :set_email_recipient

  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_uniqueness_of :email, case_sensitive: false

  has_one :email_recipient, dependent: :destroy, as: :collectible

  def set_email_recipient
    self.email_recipient = EmailRecipient.find_or_create_by(email: email)
  end
end
