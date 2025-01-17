# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
haruki = Author.create(name: "Haruki Murakami")

book_1 = haruki.books.create(title:       "The Wind-Up Bird Chronicle",
                     pages:      607,
                     publication_year:  "1994")

book_2 = haruki.books.create(title:       "Norwegian Wood",
                     pages:      296,
                     publication_year:  "1987")

amy = Author.create(name: "Amy Tan")

book_3 = amy.books.create(title: "The Joy Luck Club",
                           pages: 288,
                           publication_year: "1989")

book_4 = amy.books.create(title: "The Bonesetter's Daughter",
                           pages: 400,
                           publication_year: "2001")

neil = Author.create(name: "Neil Gaiman")
terry= Author.create(name:"Terry Pritchett")

book_5 = Book.create(title: "Good Omen",
                            pages: 288,
                            publication_year: "1990")

book_5.authors << neil
book_5.authors << terry
