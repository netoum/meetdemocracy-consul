class AddCookiesAcceptedToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cookies_accepted, :boolean, default: false
  end
end
