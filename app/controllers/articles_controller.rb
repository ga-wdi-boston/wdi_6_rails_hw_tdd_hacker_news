class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article saved!'
      redirect_to root_path
    else
      flash.now[:alert] = 'Nope, try again.'
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :user_id)
  end

end
