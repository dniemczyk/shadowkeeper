require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do

    it "should have the content 'ShadowKeeper'" do
      visit '/static_pages/home'
      expect(page).to have_content('ShadowKeeper')
    end
  end

  describe "Help Page" do

    it "should have the content 'Help'" do
      visit '/static_pages/home'
      expect(page).to have_content('Help')
    end
  end
end
