require 'spec_helper'

describe Article do
 	describe "associations" do
 		it { have_many :comments }
 		it { belong_to :user }
 	end

 	it "is a valid article" do
 		expect(Article.create(description: "Amazing new article", link: "http://www.amaze.com")).to be_valid
 	end

 	it "is not a valid article because link is missing" do
 		expect(Article.create(description: "So cool!")).to_not be_valid
 	end

 	it "is not a valid article because description is missing" do
 		expect(Article.create(link: "http://www.cats.com")).to_not be_valid
 	end

 	describe '#vote_tally' do
 		it 'returns 1 when there is one Up Vote' do
 			@article = create(:article)
 			@article.votes << create(:up_vote)
 			expect(@article.vote_tally).to eq 1
 		end

 		it 'returns -1 when there is one Down Vote' do
 			@article = create(:article)
 			@article.votes << create(:down_vote)
 			expect(@article.vote_tally).to eq -1
 		end
 	end
end
