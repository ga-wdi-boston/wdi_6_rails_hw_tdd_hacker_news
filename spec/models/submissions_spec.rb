require 'spec_helper'

describe Submission do
	it 'is invalid without a title' do
		expect(Submission.create(url: 'http://redditgifts.com/marketplace/collection/valentines-day/?source=slfs-Vdaycooln')).to_not be_valid
	end
end