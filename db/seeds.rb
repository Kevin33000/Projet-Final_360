# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user1 = User.create!
# user2 =

# review1 = Review.new(user: user1)

Poi.destroy_all
User.destroy_all
Category.destroy_all

admin = User.create(email:'admin@visum.com', password:'123soleil')
doe = User.create(email:'lambda@visum.com', password:'123soleil')

nature = Category.create(name: 'nature')
insolite = Category.create(name: 'insolite')
monument = Category.create(name: 'monument')

Poi.create(title: "Titre de ma photo de test", category: nature, user: admin )
