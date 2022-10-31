require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "paper model should have first title, last venue and year" do
    title = "Test"
    venue = "Blub"
    year = 2000
    paper = Paper.new(title: title, venue: venue, year: year)
    expect(paper.title).to eq(title)
    expect(paper.venue).to eq(venue)
    expect(paper.year).to eq(year)
    expect(paper).to be_valid
  end

  it "author model should not be valid in some cases" do
    paper = Paper.new(title: "Test", venue: "Blub")
    expect(paper).to_not be_valid
    paper = Paper.new(title: "Test", year: 2000)
    expect(paper).to_not be_valid
    paper = Paper.new(venue: "Blub", year: 2000)
    expect(paper).to_not be_valid
    paper = Paper.new(title: "Test", venue: "Blub", year: 1.3)
    expect(paper).to_not be_valid
  end

  it "should have an empty list of authors" do
    paper = Paper.new(title: "Test", venue: "test", year: 2023)
    expect(paper.authors).to be_empty
  end
end
