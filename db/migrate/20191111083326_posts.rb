class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :img_url
      t.text :description
      t.integer :rating
      t.timestamps
    end
  end
end