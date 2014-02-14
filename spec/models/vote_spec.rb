require 'spec_helper'

describe Vote do
  describe "associations" do
  	it { belong_to :user }
  	it { belong_to :votable }
  end
  describe "votes have direction" do
	  it "is valid with direction" do
	  	up = create(:up_vote)
	  	expect(up).to be_valid
	  end
	  it "is valid with direction" do
	  	down = create(:down_vote)
	  	expect(down).to be_valid
	  end
	end
	describe "count_votes" do
	  it "counts the votes" do
	  	a = create(:article)
	 		down1 = create(:down_vote)
	 		up1 = create(:up_vote)
	 		up2 = create(:up_vote)
	  	a.votes << down1
	  	a.votes << up1
	  	a.votes << up2
	  	expect(a.count_votes).to eq 1
	  end
	end
end
