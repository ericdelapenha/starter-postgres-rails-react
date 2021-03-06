class Api::PostController < Api::BaseController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.order('id desc')
    render json: @posts
  end

  def create
    @post = Post.create!(post_params)
    render json: @post
  end

  def show
    render json: @post
  end

  def update
    @post.update!(post_params)
    render json: @post
  end

  def destroy
    @post.destroy
    render json: @post.id
  end

  private

  def post_params
    params.permit(:id, :title, :author, :content, :is_backlog)
  end

  def set_post
    @post = Post.find_by_id(params[:id])
  end
end