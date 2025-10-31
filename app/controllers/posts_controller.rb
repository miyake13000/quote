class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :get_page_from_params, only: %i[ index new ]
  before_action :authenticate_admin!, only: [ :edit, :update, :destroy ]

  # GET /
  def home
    render file: "#{Rails.root}/public/home.html"
  end

  # GET /posts
  def index
    @post = Post.new
    @posts = @page.posts.order(created_at: :desc)
    @post.page_id = @page.id
  end

  # GET /posts/:id
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.page_id = @page.id
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.turbo_stream
        format.html { redirect_to @post, notice: "Post を投稿しました" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts/:id/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream
        format.html { redirect_to @post, notice: "Post を更新しました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    respond_to do |format|
      if @post.destroy
        format.turbo_stream
        format.html { redirect_to posts_url, notice: "Post を削除しました" }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    def get_page_from_params
      @page = begin
        Page.find(params[:page_id])
      rescue ActiveRecord::RecordNotFound
        Page.last
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :page_id, :reporter, :content ])
    end
end
