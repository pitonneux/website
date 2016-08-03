class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :email, null: false

      t.timestamps
    end
  end
end
