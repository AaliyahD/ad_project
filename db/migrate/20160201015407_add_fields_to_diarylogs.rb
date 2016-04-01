class AddFieldsToDiarylogs < ActiveRecord::Migration
  def change
    add_column :diarylogs, :carbs, :integer
    add_column :diarylogs, :protein, :integer
  end
end
