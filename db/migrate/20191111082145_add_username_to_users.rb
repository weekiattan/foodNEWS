class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :profile_pic, :text
    add_index :users, :username, unique: true
  end
end
