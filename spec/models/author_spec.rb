require 'rails_helper'

RSpec.describe Author, type: :model do
  it "author model should have first name, last name and homepage" do
    first_name = "Alan"
    last_name = "Turing"
    homepage = "http://wikipedia.org/Alan_Turing"
    author = Author.new(first_name: first_name, last_name: last_name, homepage: homepage)
    expect(author.first_name).to eq(first_name)
    expect(author.last_name).to eq(last_name)
    expect(author.homepage).to eq(homepage)
    expect(author.name).to eq(first_name + " " + last_name)
  end

  it "author model should not be valid if last name missing" do
    author = Author.new(first_name: "Alan", homepage: "http://wikipedia.org/Alan_Turing")
    expect(author).to_not be_valid
  end
end