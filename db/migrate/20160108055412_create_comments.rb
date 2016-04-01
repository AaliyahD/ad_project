class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :status
      t.references :post, index: true
      t.references :visitor, index: true

      t.timestamps
    end
  end
end
