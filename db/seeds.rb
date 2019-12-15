# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@haruki = Author.create(name: "Haruki Murakami")

@book_1 = @haruki.books.create(title:       "The Wind-Up Bird Chronicle",
                     pages:      607,
                     publication_year:  "1994")

@book_2 = @haruki.books.create(title:       "Norwegian Wood",
                     pages:      296,
                     publication_year:  "1987")
