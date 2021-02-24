# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

john = User.create(email: "john@john.com", password: "testtest", id: 1)
jane = User.create(email: "jane@jane.com", password: "testtest", id: 2)

allotment1 = Allotment.new(name: "Heaven", description: "A heavenly garden at your disposal.", location: "London", price: 25, area_size: 10)
allotment1.user = john
allotment1.save

allotment2 = Allotment.new(name: "Hell", description: "Not a very nice place", location: "London", price: 35, area_size: 20)
allotment2.user = jane
allotment2.save

allotment3 = Allotment.new(name: "Purgatory", description: "Clean your vegetables here", location: "London", price: 15, area_size: 5)
allotment3.user = john
allotment3.save

allotment1.photos.attach(io: URI.open('https://res.cloudinary.com/dpr5bc2dy/image/upload/v1614102675/allotment1_rfabmj.jpg'), filename: 'allotment1_rfabmj.jpeg', content_type: 'image/jpeg')
allotment2.photos.attach(io: URI.open('https://res.cloudinary.com/dpr5bc2dy/image/upload/v1614102676/allotment2_rdiang.jpg'), filename: 'allotment2.jpeg', content_type: 'image/jpeg')
allotment3.photos.attach(io: URI.open('https://res.cloudinary.com/dpr5bc2dy/image/upload/v1614102676/allotment3_o1u0ym.jpg'), filename: 'allotment3.jpeg', content_type: 'image/jpeg')

