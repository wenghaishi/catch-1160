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
  password: "123456",
  account_type: "user"
)
studio_user.photo.attach(io: File.open("app/assets/images/user_img/studio_user.avif"), filename: "studio_user.avif", content_type: "image/avif")
studio_user.banner.attach(io: File.open('app/assets/images/user_img/studio_user_banner.avif'), filename: "studio_user_banner.avif", content_type: "image/avif")

p "Created studio_user user"

gym_user = User.create!(
  username: "Gym User",
  first_name: "HODL",
  last_name: "LORD",
  email: "mahrine@enhanceronly.com",
  password: "654321",
  account_type: "user"
)
gym_user.photo.attach(io: File.open("app/assets/images/user_img/gym_user.avif"), filename: "gym_user.avif", content_type: "image/avif")
gym_user.banner.attach(io: File.open('app/assets/images/user_img/gym_user_banner.avif'), filename: "gym_user_banner.avif", content_type: "image/avif")

p "Created gym_user user"

#Studio owner: user with business account
studio_owner = User.create!(
  username: "Studio Owner",
  first_name: "NOTA",
  last_name: "WHALE",
  email: "glennuni@kenvanharen.com",
  password: "567890",
  account_type: "business"
)
studio_owner.photo.attach(io: File.open("app/assets/images/user_img/studio_owner.avif"), filename: "studio_owner.avif", content_type: "image/avif")
studio_owner.banner.attach(io: File.open('app/assets/images/user_img/studio_owner_banner.avif'), filename: "studio_owner_banner.avif", content_type: "image/avif")

p "Created studio_owner user"

#Gym owner: user with business account
gym_owner = User.create!(
  username: "Gym Owner",
  first_name: "Masterof",
  last_name: "Puppets",
  email: "faifrank2005@dealoftheyear.top",
  password: "098765",
  account_type: "business"
)
gym_owner.photo.attach(io: File.open("app/assets/images/user_img/gym_owner.avif"), filename: "gym_owner.avif", content_type: "image/avif")
gym_owner.banner.attach(io: File.open('app/assets/images/user_img/gym_owner_banner.avif'), filename: "gym_owner_banner.avif", content_type: "image/avif")

p "Created gym_owner user"

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
  category: "Avatars",
)
zodiac_collection.business = studio_business
zodiac_collection.save!

studio_business.save!
zodiac_collection.photo.attach(io: File.open('app/assets/images/collection_img/studio_profile.avif'), filename: "studio_profile.avif", content_type: "image/avif")
zodiac_collection.banner.attach(io: File.open('app/assets/images/banner_img/studio_banner.avif'), filename: "studio_banner.avif", content_type: "image/avif")

p "Created Zodiac Styles collection for Z Studio"

monkey_collection = Collection.new(
  name: "Swole Monkeys",
  description: "A collection of swole monkeys",
  category: "Membership Passes"
)
monkey_collection.business = gym_business
monkey_collection.save!
gym_business.save!
monkey_collection.photo.attach(io: File.open('app/assets/images/collection_img/gym_profile.webp'), filename: "gym_profile.avif", content_type: "image/avif")
monkey_collection.banner.attach(io: File.open('app/assets/images/banner_img/gym_banner.avif'), filename: "gym_banner.avif", content_type: "image/avif")

p "Created Swole Monkeys collection for Monkey Madness"

#Tokens
token_one = Token.create!(
  address: "80 Raffles Pl, Singapore 048624",
  collection: zodiac_collection,
  user: studio_user
)
token_one.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken1.avif'), filename: "zodiactoken1.avif", content_type: "image/avif")
# token_one.user = studio_user

token_two = Token.create!(
  address: "1 Fullerton Rd, Singapore 049213",
  collection: zodiac_collection,
  user: studio_user
)
token_two.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken2.avif'), filename: "zodiactoken2.avif", content_type: "image/avif")


token_three = Token.create!(
  address: "88 Market St, Singapore 048948",
  collection: zodiac_collection
)
token_three.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken3.avif'), filename: "zodiactoken3.avif", content_type: "image/avif")

token_four = Token.create!(
  address: "2 Battery Rd, Maybank Tower, Singapore 049907",
  collection: zodiac_collection
)
token_four.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken4.avif'), filename: "zodiactoken4.avif", content_type: "image/avif")

token_five = Token.create!(
  address: "11 Collyer Quay, Singapore 049317",
  collection: zodiac_collection
)
token_five.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken5.avif'), filename: "zodiactoken5.avif", content_type: "image/avif")

token_six = Token.create!(
  address: "5 Stadium Walk, Level 3, Singapore 397693",
  collection: monkey_collection,
  user: gym_user
)
token_six.photo.attach(io: File.open('app/assets/images/token_img/swoletoken1.avif'), filename: "swoletoken1.avif", content_type: "image/avif")

token_seven = Token.create!(
  address: "2 Stadium Walk, Singapore 397691",
  collection: monkey_collection,
  user: gym_user
)
token_seven.photo.attach(io: File.open('app/assets/images/token_img/swoletoken2.avif'), filename: "swoletoken2.avif", content_type: "image/avif")

token_eight = Token.create!(
  address: "1 Stadium Pl, Singapore 397628",
  collection: monkey_collection
)
token_eight.photo.attach(io: File.open('app/assets/images/token_img/swoletoken3.avif'), filename: "swoletoken3.avif", content_type: "image/avif")

token_nine = Token.create!(
  address: "230 Stadium Blvd, Singapore 397799",
  collection: monkey_collection
)
token_nine.photo.attach(io: File.open('app/assets/images/token_img/swoletoken4.avif'), filename: "swoletoken4.avif", content_type: "image/avif")

token_ten = Token.create!(
  address: "38 Jln Benaan Kapal, Singapore 399635",
  collection: monkey_collection
)
token_ten.photo.attach(io: File.open('app/assets/images/token_img/swoletoken5.avif'), filename: "swoletoken5.avif", content_type: "image/avif")

p "Created #{Token.count} tokens"
