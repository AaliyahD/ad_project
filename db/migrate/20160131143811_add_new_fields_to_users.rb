class AddNewFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :advice, :text
    add_column :users, :height, :varchar
    add_column :users, :starting_weight, :varchar
    add_column :users, :current_weight, :varchar
    add_column :users, :location, :varchar
  end
end
