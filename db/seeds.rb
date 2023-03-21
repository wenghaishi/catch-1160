# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Tokens
Token.create!([{
  name: "Rabid Rabbit",
  address: "80 Raffles Pl, Singapore 048624",
  lat: 1.284340,
  long: 103.852318,
  caught: false
},
{
  name: "Sexy Snake",
  address: "2 Battery Rd, Maybank Tower, Singapore 049907",
  lat: 1.285890,
  long: 103.852524,
  caught: false
},
{
  name: "Terrible Tiger",
  address: "11 Collyer Quay, Singapore 049317",
  lat: 1.2836908523527344,
  long: 103.85249104211718,
  caught: false
},
{
  name: "Dangerous Dragon",
  address: "88 Market St, Singapore 048948",
  lat: 1.2844504241297248,
  long: 103.85024458403014,
  caught: true
},
{
  name: "Rocking Rooster",
  address: "1 Fullerton Rd, Singapore 049213",
  lat: 1.2863090322387198,
  long: 103.85406901819117,
  caught: true
},
{
  name: "Swole Orangutang",
  address: "5 Stadium Walk, Level 3, Singapore 397693",
  lat: 1.3026244924604358,
  long: 103.87698922737276,
  caught: false
},
{
  name: "Swole Chimp",
  address: "2 Stadium Walk, Singapore 397691",
  lat: 1.3008546914131878,
  long: 103.87436066251465,
  caught: false
},
{
  name: "Swole Gorilla",
  address: "1 Stadium Pl, Singapore 397628",
  lat: 1.3034074949514634,
  long: 103.87288008312517,
  caught: false
},
{
  name: "Swole Baboon",
  address: "230 Stadium Blvd, Singapore 397799",
  lat: 1.3044494584159845,
  long: 103.88233326804941,
  caught: true
},
{
  name: "Swole Mankey",
  address: "38 Jln Benaan Kapal, Singapore 399635",
  lat: 1.3022142296611585,
  long: 103.8797685314866,
  caught: true
}])

p "Created #{Token.count} tokens"

#Collections
studio_collection = Collection.new(name: "Zodiac Styles")
studio_collection.save
p "Created Zodiac Styles collection for Z Studio"

gym_collection = Collection.new(nane: "Swole Monkeys")
gym_collection.save
p "Created Monkey Madness collection for Monkey Madness"

#Users
studio_user = User.new(
  first_name: "NOTA",
  last_name: "WHALE",
  email: "glennuni@kenvanharen.com",
  img_url: "https://www.shutterstock.com/image-photo/funny-nerd-geek-have-idea-260nw-492607711.jpg",
  password: "567890",
  account_type: "user"
)
p "Created studio_user user"

gym_user = User.new(
  first_name: "HODL",
  last_name: "LORD",
  email: "mahrine@enhanceronly.com",
  img_url: "https://p1.pxfuel.com/preview/569/23/752/hulk-marvel-actionfigure-nerd-royalty-free-thumbnail.jpg",
  password: "654321",
  account_type: "user"
)
p "Created gym_user user"

#User with business access
studio_owner = User.new(
  first_name: "Tooda",
  last_name: "Moon",
  email: "bifoj92445@etondy.com",
  img_url: "https://www.shutterstock.com/image-photo/drunk-young-man-office-clothes-260nw-170152655.jpg",
  password: "123456",
  account_type: "business"
)
studio_business = Business.new(name: "Z Studio", address: "30 Raffles Pl, Singapore 048622")
studio_business.save
studio_business.user = studio_owner
studio_owner.save
p "Created studio_owner user"

gym_owner = User.new(
  first_name: "Masterof",
  last_name: "Puppets",
  email: "faifrank2005@dealoftheyear.top",
  img_url: "https://itk-assets.nyc3.cdn.digitaloceanspaces.com/2021/03/avengers-endgame-thanos-snap.jpg",
  password: "098765",
  account_type: "business"
)
gym_business = Business.new(name: "Monkey Madness", address: "Stadium Blvd, Singapore 397804")
gym_business.save
gym_business.user = gym_owner
gym_owner.save
p "Created gym_owner user"
