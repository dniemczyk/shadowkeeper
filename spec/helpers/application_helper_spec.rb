require 'spec_helper'

describe ApplicationHelper do

  describe 'full_title' do
    let(:title) { "foo" }

    it "should include the page title" do
      expect(full_title(title)).to match(/foo/)
    end

    it "should include the base title" do
      expect(full_title(title)).to match(/^ShadowKeeper/)
    end

    it "should not include the title seperator for home page" do
      expect(full_title("")).not_to match(/\|/)
    end

  end
end
