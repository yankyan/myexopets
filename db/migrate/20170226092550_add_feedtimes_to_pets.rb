class AddFeedtimesToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :feedtimes, :integer
  end
end
