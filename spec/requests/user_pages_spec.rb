require 'spec_helper'

describe "User Pages" do
	subject { page }

	describe "SignUp page" do
		before { visit signup_path }

		it { should have_content('Registrarse') }
		it { should have_title(full_title('Registrarse')) }
	end
end
