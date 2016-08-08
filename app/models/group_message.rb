class GroupMessage < ApplicationRecord
  has_and_belongs_to_many :email_recipients

  validates_presence_of :message
end
