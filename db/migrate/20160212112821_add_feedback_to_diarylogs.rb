class AddFeedbackToDiarylogs < ActiveRecord::Migration
  def change
  	add_column :diarylogs, :feedback, :text
  end
end
