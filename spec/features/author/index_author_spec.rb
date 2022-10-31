require "rails_helper"

describe "Author index page", :type => :feature do
    it "should render without error" do
        visit authors_path
    end

    it "should have a link to create a new author" do
        visit authors_path
        expect(page).to have_link 'New author', href: new_author_path
    end
    
    it "should have a table with a row for each author" do
        visit authors_path
        expect(page).to have_css('table tr', count: Author.count + 1)
    end
    
    it "should have a link to each author's edit page" do
        visit authors_path
        Author.all.each do |author|
            expect(page).to have_link('Edit', href: edit_author_path(author))
        end
    end

    it "should have a link to show an author" do
        visit authors_path
        Author.all.each do |author|
            expect(page).to have_link('Show', href: author_path(author))
        end
    end

    it "should have a link to delete an author" do
        visit authors_path
        Author.all.each do |author|
            expect(page).to have_link('Delete', href: delete_author_path(author))
        end
    end

    it "should be able to delete an author" do
        visit authors_path
        @count = Author.count
        @alan = FactoryBot.create :author
        expect(Author.count).to eq(@count + 1)
        @alan.destroy
        expect(Author.count).to eq(@count)
    end
end