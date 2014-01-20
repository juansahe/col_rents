require 'spec_helper'

describe "Authentication" do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_title('Sign In') }
		it { should have_content('Sign In') }
    
    describe "with invalid credentials" do
      before { click_button "Log In" }
      
      it { should have_title('Log In') }
      it { should have_selector('div.alert.alert-error') }
    end
    
    describe "with valid credentials" do
      let(:user_auth) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",      with: user_auth.email.upcase
        fill_in "Password",   with: user_auth.password
        click_button "Log In"
      end
      
      it { should have_title(user_auth.name) }
      it { should have_link('Profile',    href: user_path(user)) }
      it { should have_link('Log Out',    href: signout_path) }
      it { should_not have_link('Log In', href: signin_path) }
    end
	end
end
