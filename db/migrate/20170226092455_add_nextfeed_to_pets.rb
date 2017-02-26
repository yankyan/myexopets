class AddNextfeedToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :nextfeed, :date
  end
end
