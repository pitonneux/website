class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
