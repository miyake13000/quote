class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :get_year_from_params, only: %i[ index new ]

  # GET /
  def home
    render file: "#{Rails.root}/public/home.html"
  end

  # GET /posts
  def index
    if @year
      @posts = Post.where(year: @year)
    else
      @posts = Post.all
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.year = @year_param || get_current_year
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
    redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    def get_year_from_params
      @year = begin
        Integer(params.expect(:year))
      rescue
        nil
      end
    end

    def get_current_year
      date = Date.today
      if date.month >= 4
        date.year
      else
        nil
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :year, :reporter, :content ])
    end
end
