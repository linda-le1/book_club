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

  @neil = Author.create(name: "Neil Gaiman")

  @terry= Author.create(name:"Terry Pritchett")

  @book_5 = Book.create(title: "Good Omen",
                              pages: 288,
                              publication_year: "1990")

  @book_5.authors << @neil
  @book_5.authors << @terry
end

  it "can visit the author show page from the book index and see list of books and stats" do

  visit "/books"

  within "#book-#{@book_1.id}" do
    click_on("#{@haruki.name}")
    expect(current_path).to eq("/authors/#{@haruki.id}")
  end

  expect(page).to have_content(@haruki.name)
  expect(page).to_not have_content(@amy.name)

  expect(page).to have_content(@book_1.title)
  expect(page).to have_content(@book_2.title)
  expect(page).to_not have_content(@book_3.title)
  expect(page).to_not have_content(@book_4.title)

  expect(page).to have_content("This author has written an average of 451.5 pages.")
  expect(page).to_not have_content("This author has written an average of 344.0 pages.")

  end

  it "can see book info for one with multiple authors" do

    visit "/authors/#{@neil.id}"
    expect(page).to have_content(@book_5.title)
    expect(page).to have_content("This author has written an average of 288.0 pages.")

    visit "/authors/#{@terry.id}"
    expect(page).to have_content(@book_5.title)
    expect(page).to have_content("This author has written an average of 288.0 pages.")
  end
end
