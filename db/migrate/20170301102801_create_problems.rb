class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.integer :pet_id
      t.date :date
      t.string :desk

      t.timestamps
    end
  end
end
