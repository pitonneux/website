# frozen_string_literal: true
class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
