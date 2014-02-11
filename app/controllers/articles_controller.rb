class ArticlesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :new, :create]

	def index
		@articles = Article.all
	end

	def new
			@article = Article.new
		end

		def create
			@article = Article.new(article_params)
			@article.save
			if @article.save
				redirect_to articles_path
			else
				render :new
			end
		end

		private

		def article_params
			params.require(:article).permit(:title, :blurb, :content)
		end
end
