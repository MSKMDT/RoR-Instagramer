class PostsController < ApplicationController

  # before_action: authenciate_user
  # before_action:
  # before_action: 

  def create
    @post = Post.new(post_params)

    logger.debug(params)

    @post.save
    redirect_to @post
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @post = Post.all
  end

  def destroy
    @post.destroy
    respond_to do |format|

  end

  private

  def require_auth
    if @post.user_id != current_user.id
      flash[:alert] = "You are not authorized to perform that action"
      redirect_to :back
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :picture)
  end

end
