class CreateMasses < ActiveRecord::Migration[5.0]
  def change
    create_table :masses do |t|
      t.integer :pet_id
      t.date :date
      t.integer :mass

      t.timestamps
    end
  end
end
