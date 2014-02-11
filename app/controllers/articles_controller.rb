class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		article = Article.create(article_params)
		article.user_id = current_user.id
		if article.save
			redirect_to articles_path
		else
			render :new
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :url, :user)

	end

end