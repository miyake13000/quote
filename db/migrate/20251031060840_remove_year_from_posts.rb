class RemoveYearFromPosts < ActiveRecord::Migration[8.0]
  def change
    remove_column :posts, :year, :integer
  end
end
