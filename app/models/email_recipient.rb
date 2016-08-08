class EmailRecipient < ApplicationRecord
  belongs_to :collectible, polymorphic: true
  has_and_belongs_to_many :group_messages

  validates_presence_of :email
  validates_uniqueness_of :email
end
