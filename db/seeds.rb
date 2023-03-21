# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# change log messages with interpolation
# destroy table before running seed #User.destroyALL

Token.destroy_all
Collection.destroy_all
Business.destroy_all
User.destroy_all

#Users
studio_user = User.create!(
  username: "Studio User",
  first_name: "Tooda",
  last_name: "Moon",
  email: "bifoj92445@etondy.com",
  img_url: "https://www.shutterstock.com/image-photo/drunk-young-man-office-clothes-260nw-170152655.jpg",
  banner_url: "https://images.assetsdelivery.com/compings_v2/makstorm/makstorm1905/makstorm190500008.jpg",
  password: "123456",
  account_type: "user"
)
p "Created studio_user user"

gym_user = User.create!(
  username: "Gym User",
  first_name: "HODL",
  last_name: "LORD",
  email: "mahrine@enhanceronly.com",
  img_url: "https://p1.pxfuel.com/preview/569/23/752/hulk-marvel-actionfigure-nerd-royalty-free-thumbnail.jpg",
  banner_url: "http://wallpaperstock.net/green-gradient-background_wallpapers_43896_852x480.jpg",
  password: "654321",
  account_type: "user"
)
p "Created gym_user user"

#Studio owner: user with business account
studio_owner = User.create!(
  username: "Studio Owner",
  first_name: "NOTA",
  last_name: "WHALE",
  email: "glennuni@kenvanharen.com",
  img_url: "https://www.shutterstock.com/image-photo/funny-nerd-geek-have-idea-260nw-492607711.jpg",
  password: "567890",
  banner_url: "https://images.assetsdelivery.com/compings_v2/makstorm/makstorm1905/makstorm190500008.jpg",
  account_type: "business"
)

#Gym owner: user with business account
gym_owner = User.create!(
  username: "Gym Owner",
  first_name: "Masterof",
  last_name: "Puppets",
  email: "faifrank2005@dealoftheyear.top",
  img_url: "https://itk-assets.nyc3.cdn.digitaloceanspaces.com/2021/03/avengers-endgame-thanos-snap.jpg",
  password: "098765",
  banner_url: "http://wallpaperstock.net/green-gradient-background_wallpapers_43896_852x480.jpg",
  account_type: "business"
)

#Studio Business
studio_business = Business.create!(
  name: "Z Studio",
  address: "30 Raffles Pl, Singapore 048622",
  description: "A studio in the heart of Singapore's CBD, prouducing zodiac inspired avatars",
  user: studio_owner
)
p "Created studio_owner user"

#Gym Business
gym_business = Business.create!(
  name: "Monkey Madness",
  address: "Stadium Blvd Singapore 397804",
  description: "A gym at Kallang, for swole bros and those who wanna be swole",
  user: gym_owner
)
p "Created gym_owner user"

#Collections
zodiac_collection = Collection.new(
  name: "Zodiac Styles",
  description: "A collection of zodiac inspired styles",
  category: "Avatars"
)
zodiac_collection.save
zodiac_collection.business = studio_business
studio_business.save
p "Created Zodiac Styles collection for Z Studio"

monkey_collection = Collection.new(
  name: "Swole Monkeys",
  description: "A collection of swole monkeys",
  category: "Membership Passes"
)
monkey_collection.save
monkey_collection.business = gym_business
gym_business.save
p "Created Swole Monkeys collection for Monkey Madness"

#Tokens
Token.create!([{
  address: "80 Raffles Pl, Singapore 048624",
  img_url: "https://q4k4k5i2.rocketcdn.me/wp-content/uploads/2022/02/chinese-zodiac-signs-1.webp",
  collection: zodiac_collection
},
{
  address: "2 Battery Rd, Maybank Tower, Singapore 049907",
  img_url: "https://q4k4k5i2.rocketcdn.me/wp-content/uploads/2022/02/chinese-zodiac-signs-1.webp",
  collection: zodiac_collection
},
{
  address: "11 Collyer Quay, Singapore 049317",
  img_url: "https://q4k4k5i2.rocketcdn.me/wp-content/uploads/2022/02/chinese-zodiac-signs-1.webp",
  collection: zodiac_collection
},
{
  address: "88 Market St, Singapore 048948",
  img_url: "https://q4k4k5i2.rocketcdn.me/wp-content/uploads/2022/02/chinese-zodiac-signs-1.webp",
  collection: zodiac_collection
},
{
  address: "1 Fullerton Rd, Singapore 049213",
  img_url: "https://q4k4k5i2.rocketcdn.me/wp-content/uploads/2022/02/chinese-zodiac-signs-1.webp",
  collection: zodiac_collection
}])


Token.create!([{
  address: "5 Stadium Walk, Level 3, Singapore 397693",
  img_url: "https://cdn.shopify.com/s/files/1/1766/7823/products/Swole_Monkey_Next_Level_Royal_close_up.jpg?v=1654089391&width=533",
  collection: monkey_collection
},
{
  address: "2 Stadium Walk, Singapore 397691",
  img_url: "https://cdn.shopify.com/s/files/1/1766/7823/products/Swole_Monkey_Next_Level_Royal_close_up.jpg?v=1654089391&width=533",
  collection: monkey_collection
},
{
  address: "1 Stadium Pl, Singapore 397628",
  img_url: "https://cdn.shopify.com/s/files/1/1766/7823/products/Swole_Monkey_Next_Level_Royal_close_up.jpg?v=1654089391&width=533",
  collection: monkey_collection
},
{
  address: "230 Stadium Blvd, Singapore 397799",
  img_url: "https://cdn.shopify.com/s/files/1/1766/7823/products/Swole_Monkey_Next_Level_Royal_close_up.jpg?v=1654089391&width=533",
  collection: monkey_collection
},
{
  address: "38 Jln Benaan Kapal, Singapore 399635",
  img_url: "https://cdn.shopify.com/s/files/1/1766/7823/products/Swole_Monkey_Next_Level_Royal_close_up.jpg?v=1654089391&width=533",
  collection: monkey_collection
}])

p "Created #{Token.count} tokens"
