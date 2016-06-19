# frozen_string_literal: true
class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :sender, null: false
      t.string :email, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
