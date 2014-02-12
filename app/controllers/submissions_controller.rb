class SubmissionsController <  ActionController::Base
	def index
		@submissions = Submission.all
	end

	def new
			@submission = Submission.new
			@user = current_user
	end

	def create
		@submission = Submission.new(submission_params)
			if @submission.save!
				flash[:notice] = 'Created a new submission!'
      	redirect_to submissions_path
    	else
      	flash.now[:errors] = @submission.errors.full_messages
      	render :new
    	end
	end


private

	def submission_params
		params.require(:submission).permit(:title, :url, :user_id)
	end
end