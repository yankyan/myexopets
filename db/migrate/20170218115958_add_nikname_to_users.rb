class AddNiknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nikname, :string
  end
end
