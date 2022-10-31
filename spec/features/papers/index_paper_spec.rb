require "rails_helper"

describe "Paper index page", :type => :feature do
    it "should render without error" do
        visit papers_path
    end

    it "should have a link to create a new paper" do
        visit papers_path
        expect(page).to have_link 'New paper', href: new_paper_path
    end
    
    it "should have a table with a row for each paper" do
        visit papers_path
        expect(page).to have_css('table tr', count: Paper.count + 1)
    end

    
    it "should have a link to each paper's edit page" do
        visit papers_path
        Paper.all.each do |paper|
            expect(page).to have_link('Edit', href: edit_paper_path(paper))
        end
    end

    it "should have a link to delete an paper" do
        visit papers_path
        Paper.all.each do |paper|
            expect(page).to have_link('Delete', href: paper_path(paper))
        end
    end

    it "should have a link to show an paper" do
        visit papers_path
        Paper.all.each do |paper|
            expect(page).to have_link('Show', href: paper_path(paper))
        end
    end

    it "should be able to delete an paper" do
        visit papers_path
        @count = Paper.count
        @test_paper = FactoryBot.create :paper
        expect(Paper.count).to eq(@count + 1)
        @test_paper.destroy
        expect(Paper.count).to eq(@count)
    end
end