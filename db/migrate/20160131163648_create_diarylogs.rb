class CreateDiarylogs < ActiveRecord::Migration
  def change
    create_table :diarylogs do |t|
      t.string :meal_type
      t.text :description
      t.integer :calories
      t.integer :sugar
      t.integer :fat
      t.integer :sodium
      t.integer :sat_fat
      t.integer :fiber
      t.date :date
      t.time :time
      t.references :user, index: true

      t.timestamps
    end
  end
end
