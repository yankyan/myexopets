class AddSexToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :sex, :string
  end
end
