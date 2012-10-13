require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Music Zone') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "What is Hot page" do
    before { visit whatshot_path }

    it { should have_selector('h1',    text: 'What is Hot') }
    it { should have_selector('title', text: full_title('What is Hot')) }
  end

  describe "Artists page" do
    before { visit artists_path }

    it { should have_selector('h1',    text: 'Artists') }
    it { should have_selector('title', text: full_title('Artists')) }
  end

  describe "Albums page" do
    before { visit albums_path }

    it { should have_selector('h1',    text: 'Albums') }
    it { should have_selector('title', text: full_title('Albums')) }
  end
end
