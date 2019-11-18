class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :rating
      t.string :category
      t.timestamps
    end
  end
end
