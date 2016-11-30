User.destroy_all

admin = User.create(email:'admin@visum.com', password:'123soleil')
doe = User.create(email:'lambda@visum.com', password:'123soleil')

Category.destroy_all

categories = %w(
            nature
            insolite
            monument
            découvrir
            visiter
            respirer
            se\ dépenser
            manger
            )

categories.each do |c|
  Category.create!(name: c)
end
