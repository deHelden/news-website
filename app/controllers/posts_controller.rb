class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  impressionist :actions=>[:show]

  # GET /posts
  def index
    @posts = Post.all
    @categories = Category.all
    @visibilities = Visibility.all
    @visibility_hidden = Visibility.last
  end

  # GET /posts/1
  def show
    impressionist(@post)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
    @categories = Category.all
    @visibilities = Visibility.all
    @visibility_hidden = Visibility.where(name: "Hidden")
  end

  # GET /posts/1/edit
  def edit
    @categories = Category.all
    @visibilities = Visibility.all
    @visibility_hidden = Visibility.where(name: "Hidden")
  end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t('notice.create') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:name, :title, :content, :description, :published_date, :status, :importance, :rating, :category_id, :visibility_id)
  end
end
