class AddFeaturedFlagToEvents < ActiveRecord::Migration
  def change
    add_column :events, :featured, :boolean, null: false, default: false
  end
end
