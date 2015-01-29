require 'spec_helper'

describe "Welcome section" do

  describe "Home page" do
    before { visit root_path }

    it "should have just the app name in title" do
      expect(page).to have_title('ShadowKeeper')
      expect(page).not_to have_title(' | ')
    end

    it "should have the content 'ShadowKeeper'" do
      expect(page).to have_content('ShadowKeeper')
    end
  end

  describe "Help page" do
    before { visit help_path }

    it "should have a title with app name and 'help'" do
      expect(page).to have_title('ShadowKeeper | Help')
    end

    it "should have the content 'Help'" do
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do
    before { visit about_path }

    it "should have a title with app name and 'about'" do
      expect(page).to have_title('ShadowKeeper | About')
    end

    it "should have the content 'About Us'" do
      expect(page).to have_content('About Us')
    end
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Sign in"
    expect(page).to have_title('Sign in')
    click_link "About"
    expect(page).to have_title('About')
    click_link "Help"
    expect(page).to have_title('Help')
    click_link "Home"
    expect(page).to have_title('ShadowKeeper')
    expect(page).not_to have_title(' | ')
  end
end
