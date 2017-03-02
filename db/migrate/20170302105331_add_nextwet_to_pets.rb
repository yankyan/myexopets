class AddNextwetToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :nextwet, :date
  end
end
