# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "faker"


puts "Cleaning DB..."

Booking.destroy_all
Allotment.destroy_all
User.destroy_all

puts "Database cleaned. Creating new Users and Allotments..."

users = []

john = User.create(email: "john@john.com", password: "testtest", id: 1)
jane = User.create(email: "jane@jane.com", password: "testtest", id: 2)

5.times do
  user = User.create(email: Faker::Internet.email, password: "testtest")
  users << user
end

allotment1 = Allotment.new(name: "Lovely Garden", description: "This is a lovely big garden where you can grow anything you wish.", location: "Chatsworth Rd, Lower Clapton, London", price: 55, area_size: 50)
allotment1.user = john
allotment1.save

allotment2 = Allotment.new(name: "Garden for Herbs", description: "A cute little garden perfectly suitable for growing your everyday herbs.", location: "Downs Park Rd, Lower Clapton, London", price: 25, area_size: 10)
allotment2.user = jane
allotment2.save

allotment3 = Allotment.new(name: "Allotment with Greenhouse", description: "A reasonably sized allotment with a greenhouse. Perfect for vegetables and fruit", location: "138 Kingsland Rd, London", price: 65, area_size: 35)
allotment3.user = john
allotment3.save

allotment4 = Allotment.new(name: "Riverview Grounds" , description: "A well kept field of grass is framed by aromatic bushes and shrubs. A single, thick tree stands near the left edge, its bark and branches continue to be home to countless creatures. The rows of flowers are growing strong and proud, the garden provides everything they need; they're home to all sorts of life. The bushes and shrubs reach 1.5m/5ft high, but this is thanks to great care and a lot of effort. A path of marble stones loops around the garden, beckoning people to explore the garden, and showing them the best sights at the same time. Grass and roots seem to refuse to try and claim more land than they've been allocated, perhaps thanks to some intervention by green thumbs." , location: "10 Manchester Road, Stoke-on-Trent", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment4.user = users.sample
allotment4.save

allotment5 = Allotment.new(name: "Prospect Gardens" , description: "A lush garden of grass is bordered by tangled hedges, flower bushes, and shrubs. A couple of, gigantic trees stands in the back right, their branches rise like a pinnacle of the garden. The flowers and plants are trying to take all the attention in this garden, and succeeding to a large extent too; they're forever trying to expand. The hedges, flower bushes, and shrubs reach 1.5m/5ft high, but will reach far higher if they're allowed to. Various stepping stones mark the best spots, presenting visitors with an elegant way of discovering the garden. Vines and roots are starting to reclaim even all pieces of land, eager to expand their own dominion.", location: "211 Queens Road, Stockport", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment5.user = users.sample
allotment5.save

allotment6 = Allotment.new(name: "South Point Meadows", description: "A scruffy garden of grass is accompanied by a variety of flower bushes. A single, massive tree stands near the right edge, its leaves and branches offer home and shelter to an array of creatures. The smaller flower bushes are slightly overgrown, but look otherwise in great shape; they're a unique, miniature world. The flower bushes reach 1.2m/4ft high, but this is something that only seems to happen outside of the wild. Various stepping stones mark the best spots, presenting visitors with an elegant way of discovering the garden. Grass and roots are starting to reclaim even all pieces of land, eager to expand their own dominion." , location: "97 Richmond Road, Walsall", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment6.user = users.sample
allotment6.save

allotment7 = Allotment.new(name: "Foxtail Gardens" , description: "A neatly trimmed bed of grass is neighbored by joined hedges, flower bushes, and shrubs. A lone, tall boulder sits near the left edge, and next to it stands a column of stacked stones. The flower beds are fighting for their place in the garden, thankfully helped by human hands; they're highlighted with garden lights. The hedges, flower bushes, and shrubs reach 1.5m/5ft high, but they tend to grow far bigger in the wild. A couple of messages carved on stones are spread around the garden, directing visitors around in a natural way. Roots are trying to reclaim every part of the garden, always searching for now places to grow and expand." , location: "92 Kings Road, Crewe", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment7.user = users.sample
allotment7.save

allotment8 = Allotment.new(name: "The Gardens Of Venlisle", description: "An overrun plot of grass is framed by tall hedges and climbing plants. A fountain stands near the back of the garden, offering an aquatic element of tranquility, one enjoyed by birds as well. The smaller flower bushes are well kept, precisely cut, and meticulously looked after; they're a pit stop for bees. The hedges and climbing plants reach 2.1m/7ft high, but this is thanks to great care and a lot of effort. A path of marble stones loops around the garden, leading people through the garden, and making sure all the best spots are marked. Vines and grass eagerly creep and crawl their way beyond their allocated garden spots, each eager to take just a little bit more land for themselves." , location: "9623 The Green, Birmingham", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment8.user = users.sample
allotment8.save

allotment9 = Allotment.new(name: "Wildwood Allotment" , description: "A thick garden of grass is encircled by a variety of hedges and shrubs. A handful of, modest trees stands near the back, their leaves are full of nests, some abandoned, others very much alive. The rows of flowers are forming a miniature world of their own, full of mysteries and wonder; they're a forest for ants. The hedges and shrubs reach 1.8m/6ft high, but this is something that only seems to happen outside of the wild. A single path, marked with round stones, curls around the garden, beckoning people to explore the garden, and showing them the best sights at the same time. Vines and grass have already begun to crawl their way over and around the garden, eager to claim all pieces of land." , location: "238 South Street, North London", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment9.user = users.sample
allotment9.save

allotment10 = Allotment.new(name: "Pilton Growing", description: "An overrun plot of grass is framed by tangled hedges and shrubs. A, massive boulder sits near the right edge, and on top of it sits a gorgeous lantern. The flowers and plants are in need of some care and love, but look great nonetheless; they're highlighted with garden lights. The hedges and shrubs reach 1.8m/6ft high, but this is something that only seems to happen outside of the wild. Here and there lies a stepping stone, almost taking people by the hand in order to show them the best sights. Plants and vines creep and crawl their way beyond their own borders, sneakingly trying to take just a little more land." , location: "93 Manchester Road, Exeter", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment10.user = users.sample
allotment10.save

allotment11 = Allotment.new(name: "Emerald Gardens" , description: "A neglected bed of grass is surrounded by united bushes. A pagoda stands in the center of the garden, laden with gorgeous, flowering vines. The flower beds are forming a miniature world of their own, full of mysteries and wonder; they're home to all sorts of life. The bushes reach 1.8m/6ft high, but they have the potential to grow far bigger. A couple of benches are carefully placed in specific locations of the garden, offering a glimpse of the best spots. Grass and plants work together almost harmoniously to claim more land for themselves." , location: "2 West Street, Reading", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment11.user = users.sample
allotment11.save

allotment12 = Allotment.new(name: "The Plot", description: "A neatly trimmed field of grass is neighbored by thriving shrubs. A greenhouse stands to the left of the garden, offering a step into a whole different world of nature. The rows of flowers are growing without boundaries, there's not even a single weed in sight; they're buzzing with insects. The shrubs reach 1m/3ft high, but doesn't usually grow this tall. Marble slabs lie here and there, almost taking people by the hand in order to show them the best sights. Roots work together almost harmoniously to claim more land for themselves." , location: "399 Church Lane, South West London", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment12.user = users.sample
allotment12.save

allotment13 = Allotment.new(name: "Green Sanctuary" , description: "A well kept garden of grass is surrounded by overgrown flower bushes and shrubs. A greenhouse stands in the back right of the garden, offering a garden of Eden within the main garden. The rows of flowers are clearly a pride and joy within this garden, as they're very well cared for; they're a forest for ants. The flower bushes and shrubs reach 1.2m/4ft high, but they tend to grow far bigger in the wild. A small, picket fence loops around the garden, offering a glimpse of the best spots. Grass and plants work together almost harmoniously to claim more land for themselves." , location: "32 Queen Street, North London", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment13.user = users.sample
allotment13.save

allotment14 = Allotment.new(name: "The Shed", description: "A fresh plot of grass is flanked by young hedges. A fountain stands near the left edge of the garden, offering a welcome bath for birds. The smaller flower bushes are well looked after, but still allowed plenty of space to grow; they're growing in all sorts and sizes. The hedges reach 1.5m/5ft high, but this is something that only seems to happen outside of the wild. Archways overgrown with flowers are scattered throughout the garden, guiding visitors around the garden, and showing them all it has to offer. Plants and flowers seem to refuse to try and claim more land than they've been allocated, perhaps thanks to some intervention by green thumbs." , location: "80 Richmond Road, East London", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment14.user = users.sample
allotment14.save

allotment15 = Allotment.new(name: "Lovely Greens", description: "A wild garden of moss-covered grass is enclosed by intertwining hedges, flower bushes, and shrubs. A, wide tree stands to the right, its bark and branches reach for the sky, ever trying to reach higher and higher. The flower beds are in need of some care and love, but look great nonetheless; they're a unique, miniature world. The hedges, flower bushes, and shrubs reach 1m/3ft high, but they won't grow much taller than this. Various stones hint at paths around the garden, presenting visitors with an elegant way of discovering the garden. Grass and roots slightly disrupt the pristine look as they hungrily search for even more pieces of land to expand to." , location: "836 School Lane, North London", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment15.user = users.sample
allotment15.save

allotment16 = Allotment.new(name: "Garden No. 64" , description: "A luxurious field of grass is neighbored by similar flower bushes. A lone, tall tree stands in the back left, its leaves and branches cast dancing shadows on the garden below. The flowers and plants are trying to take all the attention in this garden, and succeeding to a large extent too; they're growing in all sorts and sizes. The flower bushes reach 1.8m/6ft high, but will reach far higher if they're allowed to. Marble slabs lie here and there, leading visitors to the best spots. Roots eagerly creep and crawl their way beyond their allocated garden spots, each eager to take just a little bit more land for themselves." , location: "64 Main Road, West London", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment16.user = users.sample
allotment16.save

allotment17 = Allotment.new(name: "Fennel and Fern", description: "A messy patch of grass is contoured by intertwining flower bushes and shrubs. A lone ornamental piece stands in the front, a symbolic piece for the owner of the garden. The smaller flower bushes are clearly a pride and joy within this garden, as they're very well cared for; they're giving off a plethora of scents. The flower bushes and shrubs reach 2.1m/7ft high, but this is thanks to great care and a lot of effort. A few, short signs are scattered around the garden, leading visitors to the best spots. Grass, roots, and vines are starting to reclaim even all pieces of land, eager to expand their own dominion." , location: "637 Kingsway, Cambridge", price: Faker::Number.between(from: 15, to: 50), area_size: Faker::Number.between(from: 1, to: 60))
allotment17.user = users.sample
allotment17.save

allotment1.photos.attach(io: URI.open('https://res.cloudinary.com/dpr5bc2dy/image/upload/v1614102675/allotment1_rfabmj.jpg'), filename: 'allotment1_rfabmj.jpeg', content_type: 'image/jpeg')
allotment2.photos.attach(io: URI.open('https://res.cloudinary.com/dpr5bc2dy/image/upload/v1614102676/allotment2_rdiang.jpg'), filename: 'allotment2.jpeg', content_type: 'image/jpeg')
allotment3.photos.attach(io: URI.open('https://res.cloudinary.com/dpr5bc2dy/image/upload/v1614102676/allotment3_o1u0ym.jpg'), filename: 'allotment3.jpeg', content_type: 'image/jpeg')
allotment4.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341505/allotment4_yrpnrw.jpg'), filename: 'allotment4.jpeg', content_type: 'image/jpeg')
allotment5.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341505/allotment5_jcmqch.jpg'), filename: 'allotment5.jpeg', content_type: 'image/jpeg')
allotment6.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341505/allotment6_qulgue.jpg'), filename: 'allotment6.jpeg', content_type: 'image/jpeg')
allotment7.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341505/allotment7_yugci1.jpg'), filename: 'allotment7.jpeg', content_type: 'image/jpeg')
allotment8.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341506/allotment8_ejy5fy.jpg'), filename: 'allotment8.jpeg', content_type: 'image/jpeg')
allotment9.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341506/allotment9_til3v4.jpg'), filename: 'allotment9.jpeg', content_type: 'image/jpeg')
allotment10.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341506/allotment10_mplria.jpg'), filename: 'allotment10.jpeg', content_type: 'image/jpeg')
allotment11.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341506/allotment11_qtcmjt.jpg'), filename: 'allotment11.jpeg', content_type: 'image/jpeg')
allotment12.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341507/allotment12_eqiccb.jpg'), filename: 'allotment12.jpeg', content_type: 'image/jpeg')
allotment13.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341507/allotment13_qxqazt.jpg'), filename: 'allotment13.jpeg', content_type: 'image/jpeg')
allotment14.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341507/allotment14_fcokxp.jpg'), filename: 'allotment14.jpeg', content_type: 'image/jpeg')
allotment15.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341508/allotment15_nez8xm.jpg'), filename: 'allotment15.jpeg', content_type: 'image/jpeg')
allotment16.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341508/allotment16_vrgiyk.jpg'), filename: 'allotment16.jpeg', content_type: 'image/jpeg')
allotment17.photos.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1614341508/allotment17_kxwgwh.jpg'), filename: 'allotment17.jpeg', content_type: 'image/jpeg')




