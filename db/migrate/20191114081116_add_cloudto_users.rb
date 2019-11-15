class AddCloudtoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cloud_key, :text
    add_column :users, :cloud_url, :text
  end
end
