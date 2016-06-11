class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :message, null: false

      t.timestamps null: false
    end
  end
end
