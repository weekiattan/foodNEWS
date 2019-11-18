class Search < ApplicationRecord
 def search_posts
    posts = Post.all

    posts = Post.where(["title ILIKE ?", "%#{keywords}%"]) if keywords.present?
    posts = Post.where(["category LIKE ?", "%#{category}%"]) if category.present?
    posts = Post.where(["rating LIKE ?", "%#{rating}%"]) if rating.present?

    return posts


 end
end
