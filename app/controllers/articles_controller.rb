class ArticlesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :new, :create]

	def index
		@articles = Article.all
	end

end
