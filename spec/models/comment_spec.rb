require 'spec_helper'

describe Comment do
	describe "associations" do
 		it { belong_to :article }
 		it { belong_to :user }
 	end

 	it "is a valid comment" do
 		expect(Comment.create(body: "Very insightful comment.")).to be_valid
 	end

 	describe '#vote_tally' do
 		it 'returns 1 when there is one Up Vote' do
 			@comment = create(:comment)
 			@comment.votes << create(:up_vote)
 			expect(@comment.vote_tally).to eq 1
 		end

 		it 'returns -1 when there is one Down Vote' do
 			@comment = create(:comment)
 			@comment.votes << create(:down_vote)
 			expect(@comment.vote_tally).to eq -1
 		end
 	end

end
