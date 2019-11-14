class AddCloudKeytoPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cloud_key, :text
    add_column :posts, :cloud_url, :text
  end
end
