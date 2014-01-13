require 'spec_helper'

describe "User Pages" do
	subject { page }

	describe "SignUp page" do
		before { visit signup_path }

		it { should have_content('Registrarse') }
		it { should have_title(full_title('Registrarse')) }
	end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end
