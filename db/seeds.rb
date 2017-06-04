# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # #User/artist
  # artist1 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456")
  # artist2 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456")
  # #User/company
  # company1 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, company_name: Faker::Company.name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456", is_company: true)
  # company2 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, company_name: Faker::Company.name, email: Faker::Internet.email, password: "123456", password_confirmation: "123456", is_company: true)
  # #Category
  # peinture = Category.create(name: "peinture")
  # photo = Category.create(name: "photo")
  # #Style
  # gothique = Style.create(name: "gothique")
  # grec = Style.create(name: "grec")
  # #Artwork1
  # joconde = Artwork.new(title: "La joconde")
  # joconde.user = artist1
  # joconde.category = peinture
  # joconde.style = gothique
  # joconde.save
  # #Artwork2
  # portrait = Artwork.new(title: "Portrait grec")
  # portrait.user = artist2
  # portrait.category = photo
  # portrait.style = grec
  # portrait.save
  # #Exhibition
  # louvres = Exhibition.new(start_date: "2017-01-20", end_date: "2017-04-20", min_price: 4000, title: "Expo du louvres")
  # louvres.user = company1
  # louvres.styles << gothique
  # louvres.save
  # orsay = Exhibition.new(start_date: "2017-05-20", end_date: "2017-08-20", min_price: 4000, title: "Expo du musee d'orsay")
  # orsay.user = company2
  # orsay.styles << grec
  # orsay.save

  # bid1 = Bid.new(price: 1000)
  # bid1.user = artist1
  # bid1.exhibition = louvres
  # bid1.save

  # bid2 = Bid.new(price: 2000)
  # bid2.user = artist2
  # bid2.exhibition = orsay
  # bid2.save

puts 'Start'

puts 'creating artwork'

50.times do |x|
  artwork = Artwork.new
  artwork.title = Faker::Hipster.word
  artwork.description = Faker::Hipster.paragraph(2, true, 4)
  artwork.photo_urls = ["https://unsplash.it/g/500/500?random"]
  artwork.date = Time.now
  artwork.category = Category.offset(rand(Category.count)).first
  artwork.style = Style.offset(rand(Style.count)).first
  artwork.user = User.find(21)
  if artwork.save
    puts "artwork #{x} done"
  else
    puts "artwork #{x} FAIL!!!"
  end
end

puts 'Finish !'

