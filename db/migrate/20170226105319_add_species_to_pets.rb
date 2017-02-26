class AddSpeciesToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :species, :string
  end
end
