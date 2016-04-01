class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :visitor, index: true

      t.timestamps
    end
  end
end
