require 'spec_helper'

describe "Colombia Rents" do

  subject { page }

  shared_examples_for "all colombia rents pages" do
    it { should have_selector('h1', text: heading ) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Main" do
    before { visit root_path }
    let(:heading)       { '' }
    let(:page_title)    { '' }

    it_should_behave_like "all colombia rents pages"
    it { should_not have_title('| Inicio')}

  end

  describe "About" do
    before { visit about_path }
  	
  	let(:heading)        { 'Who We Are' }
    let(:page_title)     { 'Who We Are' }

    it_should_behave_like "all colombia rents pages"

  end

  describe "Contact" do
    before { visit contact_path }
  	
    let(:heading)     { 'Contact Us' }
    let(:page_title)  { 'Contact Us'}

    it_should_behave_like "all colombia rents pages"

  end
end
