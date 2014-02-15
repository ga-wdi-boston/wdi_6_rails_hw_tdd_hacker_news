class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :get_user
  before_action :get_post
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
    @vote = Vote.new
  end

  def create
    @comment = Comment.create!(comments_params)
    @post.comments << @comment
    redirect_to post_path(@post)
  end


  private

  def get_user
    @user = current_user
  end

  def get_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end

end