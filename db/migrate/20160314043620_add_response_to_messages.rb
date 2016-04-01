class AddResponseToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :response, :text
  end
end
