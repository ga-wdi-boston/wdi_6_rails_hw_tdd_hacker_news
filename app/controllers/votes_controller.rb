class VotesController < ApplicationController

	def new
		@vote = Vote.new
	end

	def create
		@vote = Vote.create
	end
end