describe Comment do
  describe "associations" do
  	it { belong_to :article }
  	it { belong_to :user }
  end

  it "is valid with content" do
  	expect(Comment.create(content: "this is a comment")).to be_valid
  end
end
