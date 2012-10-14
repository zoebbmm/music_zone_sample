require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Wei Zhou"
        fill_in "Email",        with: "weiz1@andrew.cmu.edu"
        fill_in "Address",      with: "Pittsburgh PA, United States"
        fill_in "Password",     with: "zoebbmm"
        fill_in "Confirmation", with: "zoebbmm"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('weiz1@andrew.cmu.edu') }

        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Coming Soon! Your Music Zone!') }
        it { should have_link('Sign out') }
      end
    end
  end
end
