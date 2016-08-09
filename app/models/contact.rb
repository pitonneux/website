# frozen_string_literal: true
class Contact < ApplicationRecord
  after_commit :send_to_external_list

  belongs_to :collectible, polymorphic: true

  validates_presence_of :email
  validates_uniqueness_of :email

  def send_to_external_list
    ExternalContactService.new.call(email: email)
  end
end
