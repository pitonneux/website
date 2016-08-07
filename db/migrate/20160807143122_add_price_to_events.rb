class AddPriceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :price, :integer
  end
end
