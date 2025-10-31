class MigratePostsToPages < ActiveRecord::Migration[7.0]
  def up
    years = Post.distinct.pluck(:year)
    pages = {}
    years.each do |y|
      pages[y] = Page.create!(name: "#{y}年度迷言集")
    end

    Post.find_each do |post|
      post.update!(page: pages[post.year])
    end
  end

  def down
    Post.find_each do |post|
      post.update!(year: post.page&.match(/(\d{4})年度迷言集\z/, 1).to_i)
    end
    Page.delete_all
  end
end
