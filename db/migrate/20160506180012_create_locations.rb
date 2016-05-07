class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.text :directions
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
