# should contain all the record creation needed to seed the database.
# The data can then be loaded with rails db:seed command
# (or created alongside the database with db:setup).

# Examples:  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

# user1 = User.create!
# review1 = Review.new(user: user1)

Poi.destroy_all
User.destroy_all
Category.destroy_all

admin = User.create(email:'admin@visum.com', password:'123soleil')
doe = User.create(email:'lambda@visum.com', password:'123soleil')

nature = Category.create(name: 'nature')
insolite = Category.create(name: 'insolite')
monument = Category.create(name: 'monument')

5.times do |i|
  Poi.create(
    title: "Bordeaux Victoire",
    category: insolite,
    user: doe,
    address: "Rue de bdx, 33000 BORDEAUX",
    caption: "http://www.bordeaux-tourisme.com/var/ezwebin_site/storage/images/media/images/bordeaux-gp/rendez-vous-a-bordeaux/684165-7-fre-FR/Rendez-vous-a-Bordeaux_format_1140x522.jpg")
end

poi = [
  {
    title: "Le Wagon",
    catergory: "insolite",
    user: "Murielle",
    address: "107 Cours Balguerie Stuttenberg",
    caption: "http://static.latribune.fr/full_width/521995/le-wagon-formation-ccib.jpg"
  },
  {
    title: "Auchan",
    category: "monument",
    user: "Kevin.M",
    address: "57 Rue du Château d'Eau",
    caption: "http://images.google.fr/imgres?imgurl=http%3A%2F%2Fwww.justacote.com%2Fphotos_entreprises%2Fauchan-bordeaux-1322256790.jpg&imgrefurl=http%3A%2F%2Fwww.justacote.com%2Fbordeaux-33000%2Fsuperette-et-supermarche%2Fauchan-908143.htm&h=600&w=800&tbnid=oOKPCnP0w9-ewM%3A&vet=1&docid=OTOFKUzrjix_3M&ei=C4I0WI77MsuRgAbVmqmQCA&tbm=isch&iact=rc&uact=3&dur=2448&page=0&start=0&ndsp=15&ved=0ahUKEwjOrOSq87zQAhXLCMAKHVVNCoIQMwgeKAEwAQ&bih=673&biw=1301"
  }
]
