class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :voteable

  validate :must_have_one_field

  def must_have_one_field
    missing_field_msg	 = "You need to specify an article or a link, or both" 
  	if !article?
  		if !links?
				errors.add :base, missing_field_msg
				return false
  		end
  	end

  	if !links?
  		if !article?
				errors.add :base, missing_field_msg
				return false
  		end
  	end
	end
end
