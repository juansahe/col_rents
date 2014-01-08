require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do

    it "should have the content 'Colombia Rents'" do
      visit 'static_pages/home'
      expect(page).to have_content('Colombia Rents')
      response.status.should be(200)
    end
  end
end
