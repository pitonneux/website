class NewsItem < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
end
