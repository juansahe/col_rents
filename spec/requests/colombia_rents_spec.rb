require 'spec_helper'

describe "Colombia Rents" do

  describe "Principal" do
    
    it "should have the content 'Colombia Rents'" do
      visit '/colombia_rents/principal'
      expect(page).to have_content('Colombia Rents')
    end

    it "should have the base title" do
    	visit '/colombia_rents/principal'
    	expect(page).to have_title('Colombia Rents | Alquiler de Inmuebles en Cartagena Colombia')
    end

    it "should not have a custom title" do
    	visit '/colombia_rents/principal'
    	expect(page).not_to have_title('| Inicio')
    end

  end

  describe "Who we are" do
  	
  	it "should have the content 'Quienes Somos'" do
  		visit '/colombia_rents/acerca'
  		expect(page).to have_content('Quienes Somos')
  	end

  	it "should have the title 'Quienes Somos'" do
  		visit '/colombia_rents/acerca'
  		expect(page).to have_title('Quienes Somos')
  	end
  	
  end

  describe "Contact" do
  	
  	it "should have the content 'Contacto'" do
  		visit '/colombia_rents/contacto'
  		expect(page).to have_content('Contacto')
  	end

  	it "should have the title 'Contacto'" do
  		visit '/colombia_rents/contacto'
  		expect(page).to have_title('Contacto')
  	end
  
  end

end
