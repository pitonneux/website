# frozen_string_literal: true
class EmailRecipient < ApplicationRecord
  after_commit :send_to_external_list

  belongs_to :collectible, polymorphic: true
  has_and_belongs_to_many :group_messages

  validates_presence_of :email
  validates_uniqueness_of :email

  def send_to_external_list
    ExternalContactService.new.call(email: email)
  end
end
