class CommentsController < ActionController::Base

	def index
	end

	def new
		@comment = Comment.new
	end

	def create

	end

end