class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.integer :year
      t.string :reporter

      t.timestamps
    end
  end
end
