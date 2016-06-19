# frozen_string_literal: true
class AddCoverImageToEvents < ActiveRecord::Migration
  def change
    add_column :events, :cover_image, :string
  end
end
