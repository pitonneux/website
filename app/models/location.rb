# frozen_string_literal: true
class Location < ActiveRecord::Base
  belongs_to :organization
  has_many :events

  validates_presence_of :name
end
