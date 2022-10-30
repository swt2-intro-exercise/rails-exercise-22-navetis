require "rails_helper"

describe "Author edit page", type: :feature do

    before :each do
        @alan = FactoryBot.create :author
    end

    it "should render withour error" do
        visit edit_author_path(@alan)
    end

    it "should have text inputs for an author's first name, last name, and homepage" do
        visit edit_author_path(@alan)
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should be able to edit an author" do
        visit edit_author_path(@alan)
        page.fill_in 'author[first_name]', with: 'Alan Mathison'
        page.fill_in 'author[last_name]', with: 'Thomas'
        page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Thomas'
        find('input[type="submit"]').click
        @alan.reload
        expect(@alan.first_name).to eq('Alan Mathison')
        expect(@alan.last_name).to eq('Thomas')
        expect(@alan.homepage).to eq('http://wikipedia.org/Alan_Thomas')
    end
end