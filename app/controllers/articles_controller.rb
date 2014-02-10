class ArticlesController < ApplicationController

	def index
	end

	def new
		@article = Article.new
	end

	def create
		redirect_to articles_path
	end

end