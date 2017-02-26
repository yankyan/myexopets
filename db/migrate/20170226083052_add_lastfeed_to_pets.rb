class AddLastfeedToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :lastfeed, :date
  end
end
