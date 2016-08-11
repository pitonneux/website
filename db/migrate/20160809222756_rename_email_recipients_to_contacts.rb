class RenameEmailRecipientsToContacts < ActiveRecord::Migration[5.0]
  def change
    rename_table :email_recipients, :contacts
  end
end
