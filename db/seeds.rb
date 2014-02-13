User.create!(email: "anna@3e.org", password: "asdfasdf")
User.create!(email: "bob@gmail.com", password: "asdfasdf")
User.create!(email: "mary@gmail.com", password: "asdfasdf")

10.times do
	User.all[0].posts.create!(title: "Aliquam tincidunt mauris eu risus", link: "http://vestibulus.com", description: "Pellentesque fermentum dolor. Aliquam quam lectus, facilisis auctor, ultrices ut, elementum vulputate, nunc.")
	User.all[1].posts.create!(title: "Suspendisse mauris fusce accumsan mollis eros", link: "http://placerat.com", description: "Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat.")
	User.all[2].posts.create!(title: "Nam convallis pellentesque nis", link: "http://tortor.com", description: "Sed adipiscing ornare risus. Morbi est est, blandit sit amet, sagittis vel, euismod vel, velit. Pellentesque egestas sem. Suspendisse commodo ullamcorper magna.")
end

8.times do
	Post.all.each do |post|
		post.comments.create!(user_id: 1, body: "Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc. Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur gravida.")
	end
end
