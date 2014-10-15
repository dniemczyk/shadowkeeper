require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    it "should have just the app name in title" do
      visit '/static_pages/home'
      expect(page).to have_title('ShadowKeeper')
      expect(page).not_to have_title(' | ')
    end

    it "should have the content 'ShadowKeeper'" do
      visit '/static_pages/home'
      expect(page).to have_content('ShadowKeeper')
    end
  end

  describe "Help Page" do
    it "should have a title with app name and 'help'" do
      visit '/static_pages/help'
      expect(page).to have_title('ShadowKeeper | Help')
    end

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do
    it "should have a title with app name and 'about'" do
      visit '/static_pages/about'
      expect(page).to have_title('ShadowKeeper | About')
    end

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
end
