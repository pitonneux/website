class CreateEmailRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :email_recipients do |t|
      t.string :email, null: false
      t.belongs_to :collectible, polymorphic: true

      t.timestamps
    end
  end
end
