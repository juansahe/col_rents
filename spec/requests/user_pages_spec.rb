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
				fill_in "Name",				with:"Example User"    
				fill_in "user_email", 		with:"user@example.com" 		    
				fill_in "user_password",	with:"foobar"
				fill_in "Confirmation",		with:"foobar"
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
    	before do
    		sign_in user 
    		visit user_path(user)
    	end
    	it { should have_content(user.name) }
    	it { should have_title(user.name) }
 	end

 	describe "edit" do
 		let(:user) { FactoryGirl.create(:user) }
 		before do
 			sign_in user
 			visit edit_user_path(user)
 		end

 		describe "page" do
 			it { should have_content('Update your profile') }
 			it { should have_title('Edit user') }
 		end

 		describe "with invalid credentials" do
 			before { click_button "Save Changes" }

 			it { should have_content('error')}
 		end

 		describe "with valid credentials" do
 			let(:new_name) 	{ "New Name" }
 			let(:new_email) { "new@email.com" }
 			before do
 				fill_in "Name", 			with: new_name
 				fill_in "Email", 			with: new_email
 				fill_in "Password", 		with: user.password
 				fill_in "Confirmation",		with: user.password
 				click_button "Save Changes"
 			end

 			it { should have_title(new_name) }
 			it { should have_selector('div.alert.alert-success') }
 			it { should have_link('Log Out', href: signout_path) }
      		specify { expect(user.reload.name).to  eq new_name }
      		specify { expect(user.reload.email).to eq new_email }
      	end
 	end
end
