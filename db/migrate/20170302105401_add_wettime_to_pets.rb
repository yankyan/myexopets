class AddWettimeToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :wettime, :integer
  end
end
