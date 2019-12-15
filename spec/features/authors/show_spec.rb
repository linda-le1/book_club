require "rails_helper"

RSpec.describe "As a visitor", type: :feature do
  before :each do

  @haruki = Author.create(name: "Haruki Murakami")

  @book_1 = @haruki.books.create(title:       "The Wind-Up Bird Chronicle",
                                 pages:      607,
                                 publication_year:  "1994")

  @book_2 = @haruki.books.create(title:       "Norwegian Wood",
                                 pages:      296,
                                 publication_year:  "1987")

  @amy = Author.create(name: "Amy Tan")

  @book_3 = @amy.books.create(title: "The Joy Luck Club",
                              pages: 288,
                              publication_year: "1989")

  @book_4 = @amy.books.create(title: "The Bonesetter's Daughter",
                              pages: 400,
                              publication_year: "2001")

end

  it "can visit the author show page from the book index and see list of books and stats"

  visit "/books"

  click_on("#{@haruki.name}")
  expect(current_path).to eq("/authors/#{@haruki.id}")

  expect(page).to have_content()
  end

  Then I am taken to an Author Show Page where I see the author with that id including the author's:
  - name
  - the title of each book they have written
  - the average number of pages for all of their books
