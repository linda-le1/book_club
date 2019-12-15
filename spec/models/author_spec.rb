require 'rails_helper'

RSpec.describe Author, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :book_authors}
    it {should have_many(:books).through(:book_authors)}
  end

  describe 'methods' do
    it ".average_age" do

      @haruki = Author.create(name: "Haruki Murakami")

      @book_1 = @haruki.books.create(title:       "The Wind-Up Bird Chronicle",
                                     pages:      607,
                                     publication_year:  "1994")

      @book_2 = @haruki.books.create(title:       "Norwegian Wood",
                                     pages:      296,
                                     publication_year:  "1987")

      expect(Author.average_pages_wrriten).to eq(451.5)

    end
  end
end
