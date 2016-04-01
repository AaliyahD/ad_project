class RemoveSubjectsFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :subjects, :text
  end
end
