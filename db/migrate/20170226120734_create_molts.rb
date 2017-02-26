class CreateMolts < ActiveRecord::Migration[5.0]
  def change
    create_table :molts do |t|
      t.date :date
      t.integer :pet_id

      t.timestamps
    end
  end
end
