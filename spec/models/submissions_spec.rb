require 'spec_helper'

describe Submission do
	it 'is invalid without a title' do
		expect(Submission.create(url: 'http://redditgifts.com/marketplace/collection/valentines-day/?source=slfs-Vdaycooln')).to_not be_valid
		expect(Submission.create(text_block: "blah")).to_not be_valid
	end

	it 'is invalid without either a url or a text block' do
		expect(Submission.create(title: 'Happy Story')).to_not be_valid
	end

	it 'has a user' do
		expect(Submission.create(title: 'A Great Read', url: 'http://publishing.cdlib.org/ucpressebooks/view?docId=ft5q2nb3z7&brand=ucpress')).to_not be_valid
	end
end