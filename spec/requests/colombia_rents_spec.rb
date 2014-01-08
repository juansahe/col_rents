require 'spec_helper'

describe "Colombia Rents" do

  describe "Principal" do
    it "should have the content 'Colombia Rents'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/colombia_rents/principal'
      expect(page).to have_content('Colombia Rents')
    end

    it "should have the title 'Incio'" do
    	visit '/colombia_rents/principal'
    	expect(page).to have_title('Colombia Rents | Inicio')
    end

  end

  describe "Who we are" do
  	it "should have the content 'Quienes Somos'" do
  		visit '/colombia_rents/acerca'
  		expect(page).to have_content('Quienes Somos')
  	end

  	it "should have the title 'Quienes Somos'" do
  		visit '/colombia_rents/acerca'
  		expect(page).to have_title('Colombia Rents | Quienes Somos')
  	end
  	
  end

end
