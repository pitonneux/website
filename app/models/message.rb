# frozen_string_literal: true
class Message < ActiveRecord::Base
  validates_presence_of :sender
  validates_presence_of :content
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_one :contact, dependent: :destroy, as: :collectible
end
