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

  it "can visit the author show page from the book index and see list of books and stats" do

  visit "/books"

  within "#book-#{@book_1.id}" do
    click_on("#{@haruki.name}")
    expect(current_path).to eq("/authors/#{@haruki.id}")
  end

  expect(page).to have_content(@haruki.name)
  expect(page).to have_content(@amy.name)

  expect(page).to have_content(@book_1.title)
  expect(page).to have_content(@book_2.title)
  expect(page).to_not have_content(@book_3.title)
  expect(page).to_not have_content(@book_4.title)

  expect(page).to have_content("451.5 pages")
  expect(page).to_not have_content("344 pages")

  end
end
