require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    before { visit root_path }

    it "should have just the app name in title" do
      expect(page).to have_title('ShadowKeeper')
      expect(page).not_to have_title(' | ')
    end

    it "should have the content 'ShadowKeeper'" do
      expect(page).to have_content('ShadowKeeper')
    end
  end

  describe "Help Page" do
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
end
