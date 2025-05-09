class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :get_year_from_params, only: %i[ index new ]

  # GET /
  def home
    render file: "#{Rails.root}/public/home.html"
  end

  # GET /posts
  def index
    @post = Post.new
    if @year_param
      @posts = Post.where(year: @year_param).order(created_at: :desc)
      @post.year = @year_param
    else
      @posts = Post.order(created_at: :desc)
      @post.year = current_year
    end
  end

  # GET /posts/:id
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.year = current_year
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if !@post.save
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/:id/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update
    if !@post.update(post_params)
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    def current_year
      date = Time.current.to_date
      if date.month >= 4
        date.year
      else
        date.year - 1
      end
    end

    def get_year_from_params
      @year_param = begin
        Integer(params.expect(:year))
      rescue
        nil
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :year, :reporter, :content ])
    end
end
