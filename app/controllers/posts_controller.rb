class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource
  impressionist actions: [:show]

  # GET /posts
  def index
    posts_all_published = Post.published
    @categories = Category.all
    @unpublished = Post.all.where(status: ["inactive", "active"])
    @latest = Post.all.where(published_date: DateTime.now.to_date)
    @visibilities = Visibility.all
    @visibility_hidden = Visibility.last
    @most_viewed = posts_all_published.order('impressions_count DESC').take(4)
    @most_featured = posts_all_published.order('rating DESC').take(3)
    @important_news = posts_all_published.select(&:importance?).take(3)
    @archived_news = Post.archived
    respond_to do |format|
      format.html
      format.rss
    end
    @search = params[:term].present? ? params[:term] : nil
    @posts = if @search
               results = Post.where(status: 'published', visibility_id: @visibilities.first.id).search(@search)
               Post.where(id: results.map(&:id))
             else
               Post.all.published.order('published_date DESC')
    end
  end

  # GET /posts/1
  def show
    impressionist(@post)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
    @visibility_hidden = Visibility.where(name: 'Hidden')
  end

  # GET /posts/1/edit
  def edit
    @visibility_hidden = Visibility.where(name: 'Hidden')
    @post.category_id = params[:category_id]
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)
    # @post.category_id = params[:category_id]
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: t('notice.create') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    @visibility_hidden = Visibility.where(name: 'Hidden')
    @post.category_id = params[:category_id]
    console
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t('notice.update') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to posts_url, notice: t('notice.destroy') }
    end
  end

  def feed
    @posts = Post.all.order('published_date DESC')
    @categories = Category.all
    @visibilities = Visibility.all
    @visibility_hidden = Visibility.last
    render action: :index
  end

  def autocomplete
    render json: Post.search(params[:query], {
      fields: ["title^5", "description"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:id, :name, :title, :image, :content, :description, :published_date, :status, :importance, :rating, :category_id, :visibility_id)
  end
end
