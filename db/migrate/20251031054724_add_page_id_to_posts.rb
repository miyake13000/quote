class AddPageIdToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :page, null: true, foreign_key: true
  end
end
