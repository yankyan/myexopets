class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :desk
      t.date :bday

      t.timestamps
    end
  end
end
