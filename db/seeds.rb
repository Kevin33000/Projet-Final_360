puts 'start seed'

puts 'dstroying old resources'
Review.destroy_all
Poi.destroy_all
User.destroy_all
Category.destroy_all

puts 'generate new resources'
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
    caption: "la magie, splendide !")
end

pois = [
  {
    title: "Le Wagon",
    category: insolite,
    user: admin,
    address: "107 Cours Balguerie Stuttenberg",
    caption: "c'est un lieu fantastique"
  },
  {
    title: "Auchan",
    category: monument,
    user: admin,
    address: "57 Rue du Château d'Eau",
    caption: "la vie est moins cher"
  }
]

pois.each do |poi|
  Poi.create(poi)
end

puts 'finish seed'
