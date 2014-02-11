class SubmissionsController <  ActionController::Base
	def index
		@submissions = Submission.all
	end

end