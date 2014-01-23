require 'spec_helper'

describe "User Pages" do
	subject { page }

	describe "SignUp page" do
		before { visit new_user_path }

		let(:submit) { "Create Account" }

		it { should have_content('Sign Up') }
		it { should have_title(full_title('Sign Up')) }

		describe "with invalid credentials" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
			describe "after submission" do
				it { should have_selector('h3', text: 'Sign Up' ) }
			end
		end

		describe "with valid credentials" do
			before do
				fill_in "Name", 			              with:"Example User"    
				fill_in "user_email", 			        with:"user@example.com" 		    
				fill_in "user_password", 		        with:"foobar"
				fill_in "Confirmation", 	          with:"foobar"
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user_signed) {User.find_by(email: 'user@example.com') }

				it { should have_link('Log Out') }
        it { should have_title(user_signed.name) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
			end
		end
	end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end
