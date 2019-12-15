
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

end

  it "can see a list of all books and their attributes" do


    visit "/books"

    within "#book-#{@book_1.id}" do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content("By #{@haruki.name}")
      expect(page).to have_content("Number of Pages: #{@book_1.pages}")
      expect(page).to have_content("Published in #{@book_1.publication_year}")
    end

    within "#book-#{@book_2.id}" do
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content("By #{@haruki.name}")
      expect(page).to have_content("Number of Pages: #{@book_2.pages}")
      expect(page).to have_content("Published in #{@book_2.publication_year}")
    end

  end
end
