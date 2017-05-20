class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    new_post
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    new_comment
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @edit_post = @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        new_post
        format.html {redirect_to @post, notice: 'Post was successfully created.'}
        format.json {render :show, status: :created, location: @post}
        format.js {}
      else
        @edit_post = @post
        format.html {render :index}
        format.json {render json: @post.errors, status: :unprocessable_entity}
        format.js {}
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html {redirect_to @post, notice: 'Post was successfully updated.'}
        format.json {render :show, status: :ok, location: @post}
        format.js {}
      else
        format.html {render :edit}
        format.json {render json: @post.errors, status: :unprocessable_entity}
        format.js {}
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to posts_url, notice: 'Post was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  def new_post
    @edit_post = Post.new author: current_user, publish_date: DateTime.now
  end

  def new_comment
    return unless @post
    @edit_comment = Comment.new post: @post, author: current_user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :body, :author_id, :publish_date)
  end
end
