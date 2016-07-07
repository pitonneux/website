# frozen_string_literal: true
class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, if: :new_record?

  validates_presence_of :email
  validates_presence_of :password

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
