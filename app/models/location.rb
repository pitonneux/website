# frozen_string_literal: true
class Location < ApplicationRecord
  belongs_to :organization
  has_many :events

  validates_presence_of :name
end
