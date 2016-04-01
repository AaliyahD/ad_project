class AddMoreDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :hobbies, :text
    add_column :users, :status, :text
  end
end
