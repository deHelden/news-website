class CategoriesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!, except: %i[index show]

  def show
    @category_posts = @category.posts.order('published_date DESC')

    @latest_post = @category_posts.first

    @most_viewed = @category_posts.order('impressions_count DESC').take(4)

    @most_featured = @category_posts.order('rating DESC').take(3)
  end

  def set_post
    @category = Category.find(params[:id])
  end
end
