module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_on 'Sign up'
    end

    def create_article
      visit new_article_path
      fill_in 'Title', with: 'First article'
      fill_in 'Url', with: 'http://richardlynch.blogspot.com/'
      click_on 'Submit'
    end

  end
end