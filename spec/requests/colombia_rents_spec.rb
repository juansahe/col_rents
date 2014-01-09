require 'spec_helper'

describe "Colombia Rents" do

  subject { page }

  describe "Main" do
    before { visit root_path }
    
    it { should have_content('Colombia Rents') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Inicio') }

  end

  describe "About" do
    before { visit about_path }
  	
  	it { should have_content('Quienes Somos') }
    it { should have_title('Quienes Somos') }

  end

  describe "Contact" do
    before { visit contact_path }
  	
    it { should have_content('Contacto') }
    it { should have_title('Contacto') }

  end

end
