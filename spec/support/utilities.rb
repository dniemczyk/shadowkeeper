# User sign in helper for tests
def sign_in(user, options={})
  if options[:no_capybara]
    session[:user_id] = user.id
  else
    visit signin_path
    fill_in "Email",    with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
