require 'spec_helper'

describe "Authentication" do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

  describe "sign in" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      # Redirect to the same 'Sign in' page
      it { should have_title('Sign in') }

      # Show error section
      it { should have_selector('div.alert.alert-danger') }

      describe "after visiting another page" do
        before { click_link "Home" }

        it { should_not have_selector('div.alert.alert-danger') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      # Redirect to user pages
      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      # A sign out should hide the user pages
      describe "followed by a 'sign out'" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
  end

  describe "authorization" do

    describe "for non signed in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "Sign in"
        end

        # Frendly forwarding to the protected page
        describe "after signing in" do
          it "should render the desired protected page" do
            expect(page).to have_title('Edit user')
          end
        end
      end

      describe "in the User Controller" do

        # Redirect to sign in page
        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('Sign in') }
        end

        # Redirect to sign in page
        describe "submiting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "visiting the user index" do
          before { visit users_path }
          it { should have_title('Sign in') }
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) do
        FactoryGirl.create(:user, email: 'wrong_email@example.com')
      end
      before { sign_in(user, no_capybara: true) }

      describe "submiting a GET request to the User#edit action" do
        before { get edit_user_path(wrong_user) }

        specify do
          expect(response.body).not_to match('Edit user')
        end

        specify do
          expect(response).to redirect_to(root_url)
        end
      end

      describe "submiting a PATCH request to the User#update action" do
        before  { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
  end
end
