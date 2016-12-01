Review.destroy_all
Poi.destroy_all
Category.destroy_all

print "Creating categories"

categories = [
  "découvrir",
  "visiter",
  "se ressourcer",
  "se souvenir",
  "se dépenser",
  "s'évader"
]

categories.each do |c|
  Category.create!(name: c)
  print "."
end

puts " done"
