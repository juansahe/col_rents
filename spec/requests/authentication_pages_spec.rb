require 'spec_helper'

describe "Authentication" do
	subject { page }

	describe "signin page" do
		before { visit signin_path }

		it { should have_title('Log In') }
		it { should have_content('Log In') }
    
    describe "with invalid credentials" do
      before { click_button "Log In" }
      
      it { should have_title('Log In') }
      it { should have_selector('div.alert.alert-danger') }

      describe "after visiting another page" do
        before { click_link "Start" }
        it { should_not have_selector('div.alert.alert-danger') }
      end
    end
    
    describe "with valid credentials" do
      let(:user_auth) { FactoryGirl.create(:user) }
      before { sign_in user_auth }
      
      it { should have_title(user_auth.name) }
      it { should have_link('Profile',    href: user_path(user_auth)) }
      it { should have_link('Settings',   href: edit_user_path(user_auth)) }
      it { should have_link('Log Out',    href: signout_path) }
      it { should_not have_link('Log In', href: signin_path) }
      
      describe "followed by signout" do
        before { click_link 'Log Out' }
        it { should have_link('Log In') }
      end      
    end
	end

  describe "authorization" do

    describe "for non logged users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          sign_in user
        end

        describe "after login in correctly" do
          it "should render the desired protected page" do
            expect(page).to have_title('Edit user')
          end
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_title('Log In') }
        end

        describe "submitting to the update action" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(signin_path) }
        end

        describe "visiting the user profile" do
          before { visit user_path(user) }
          it { should_not have_title(user.name) }
        end

      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:another_user) { FactoryGirl.create(:user, email: "another@example.com") }
      before  { sign_in user, no_capybara: true }

      describe "submitting a GET request to the Users#edit action" do
        before { get edit_user_path(another_user) }
        specify { expect(response.body).not_to match(full_title('Edit user')) }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(another_user) }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "submitting a GET request to the Users#show action" do
        before { get user_path(another_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
  end
end
