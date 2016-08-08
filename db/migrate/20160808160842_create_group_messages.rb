class CreateGroupMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :group_messages do |t|
      t.text :message, null: false
      t.timestamps
    end

    create_table :email_recipients_group_messages, id: false do |t|
      t.belongs_to :email_recipient
      t.belongs_to :group_message
    end
  end
end
