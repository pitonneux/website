class AddSignupLinkToEvents < ActiveRecord::Migration
  def change
    add_column :events, :signup_link, :string
  end
end
