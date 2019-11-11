class Reviews < ActiveRecord::Migration[5.2]
  def change
      create_table :reviews do |t|
        t.text :comments
        t.references :post
        t.timestamps
    end
  end
end