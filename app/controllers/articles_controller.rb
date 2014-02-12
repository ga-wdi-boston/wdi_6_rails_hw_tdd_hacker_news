class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @articles.sort! { |a, b| b.count_votes <=> a.count_votes }
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
      flash[:errors] = @article.errors.full_messages.join(', ')
      render :new
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :url, :text)
  end

end
