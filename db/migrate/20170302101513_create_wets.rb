class CreateWets < ActiveRecord::Migration[5.0]
  def change
    create_table :wets do |t|
      t.integer :pet_id
      t.date :date

      t.timestamps
    end
  end
end
