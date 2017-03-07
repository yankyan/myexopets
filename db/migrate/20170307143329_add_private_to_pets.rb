class AddPrivateToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :private, :boolean
  end
end
