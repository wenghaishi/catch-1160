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
  email: "user@studio.com",
  password: "123456",
  account_type: "user",
  eth_address: "0xegasdk1lds"
)
studio_user.photo.attach(io: File.open("app/assets/images/user_img/studio_user.avif"), filename: "studio_user.avif", content_type: "image/avif")
studio_user.banner.attach(io: File.open('app/assets/images/banner_img/studiouser_banner.png'), filename: "studiouser_banner.png", content_type: "image/png")

p "Created studio_user user"

gym_user = User.create!(
  username: "Gym User",
  email: "user@gym.com",
  password: "123456",
  account_type: "user",
  eth_address: "0xegasdk1lds"
)
gym_user.photo.attach(io: File.open("app/assets/images/user_img/gym_user.avif"), filename: "gym_user.avif", content_type: "image/avif")
gym_user.banner.attach(io: File.open('app/assets/images/banner_img/gymuser_banner.png'), filename: "gymuser_banner.png", content_type: "image/png")

p "Created gym_user user"

##Added New beanboi user
beanboi_user = User.create!(
  username: "Beanie Baby",
  email: "user@beanboi.com",
  password: "123456",
  account_type: "user",
  eth_address: "0xegasdk1lds"
)
beanboi_user.photo.attach(io: File.open("app/assets/images/user_img/beanboiuserprofile.avif"), filename: "beanboiuserprofile.avif", content_type: "image/avif")
beanboi_user.banner.attach(io: File.open('app/assets/images/banner_img/bbuser_banner.png'), filename: "bbuser_banner.png", content_type: "image/png")

p "Created beanboi_user user"

#Studio owner: user with business account
studio_owner = User.create!(
  username: "Studio Owner",
  email: "owner@studio.com",
  password: "654321",
  account_type: "business",
  eth_address: "0xegasdk1lds"
)
studio_owner.photo.attach(io: File.open("app/assets/images/user_img/studio_owner.avif"), filename: "studio_owner.avif", content_type: "image/avif")
studio_owner.banner.attach(io: File.open('app/assets/images/banner_img/studio_banner.png'), filename: "studio_banner.png", content_type: "image/png")

p "Created studio_owner user"

#Gym owner: user with business account
gym_owner = User.create!(
  username: "Gym Owner",
  email: "owner@gym.com",
  password: "654321",
  account_type: "business",
  eth_address: "0xegasdk1lds"
)
gym_owner.photo.attach(io: File.open("app/assets/images/user_img/gym_owner.avif"), filename: "gym_owner.avif", content_type: "image/avif")
gym_owner.banner.attach(io: File.open('app/assets/images/banner_img/gym_banner.png'), filename: "gym_banner.png", content_type: "image/png")

p "Created gym_owner user"

##Added New beanboi owner
beanboi_owner = User.create!(
  username: "Bean Boi",
  email: "owner@beanboi.com",
  password: "654321",
  account_type: "business",
  eth_address: "0xegasdk1lds"
)
beanboi_owner.photo.attach(io: File.open("app/assets/images/user_img/beanboiowner_photo.avif"), filename: "beanboiowner_photo.avif", content_type: "image/avif")
beanboi_owner.banner.attach(io: File.open('app/assets/images/banner_img/beanboi_banner.png'), filename: "beanboi_banner.png", content_type: "image/png")

p "Created beanboi_owner user"

#Studio Business
studio_business = Business.create!(
  name: "Z Studio",
  address: "30 Raffles Pl, Singapore 048622",
  description: "A studio in the heart of Singapore's CBD, prouducing zodiac inspired avatars",
  user: studio_owner
)
p "Assigned studio_owner to Z Studio"

#Gym Business
gym_business = Business.create!(
  name: "Swole Bros Gym",
  address: "Stadium Blvd Singapore 397804",
  description: "A gym at Kallang, for swole bros and those who wanna be swole",
  user: gym_owner
)
p "Assigned gym_owner to Swole Bros Gym"

##Added new beanboi business
beanboi_business = Business.create!(
  name: "Bean Boi Plushies",
  address: "1 Dunlop Street, Singapore 209331",
  description: "We're crazy about beans! Have a bean-tastic day!",
  user: beanboi_owner
)
p "Assigned beanboi_owner to Bean Boi"

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

swolebros_collection = Collection.new(
  name: "Gym Bros",
  description: "A collection of swole gym bros",
  category: "Membership Passes"
)
swolebros_collection.business = gym_business
swolebros_collection.save!
gym_business.save!
swolebros_collection.photo.attach(io: File.open('app/assets/images/collection_img/gym_profile.webp'), filename: "gym_profile.avif", content_type: "image/webp")
swolebros_collection.banner.attach(io: File.open('app/assets/images/banner_img/gym_banner.avif'), filename: "gym_banner.avif", content_type: "image/avif")

p "Created Gym Bros collection for Swole Bros Gym"

##Added new beanboi collection
greenbean_collection = Collection.new(
  name: "Green Beans",
  description: "Redeem a free mini beanboi plushie!",
  category: "Collectibles"
)
greenbean_collection.business = beanboi_business
greenbean_collection.save!
beanboi_business.save!
greenbean_collection.photo.attach(io: File.open('app/assets/images/collection_img/greenbeancollectionprofile.avif'), filename: "greenbeancollectionprofile.avif", content_type: "image/avif")
greenbean_collection.banner.attach(io: File.open('app/assets/images/banner_img/greenbeancollectionbanner.png'), filename: "greenbeancollectionbanner.png", content_type: "image/avif")

redbean_collection = Collection.new(
  name: "Red Beans",
  description: "Receive $5 off your next in-store purchase!",
  category: "Voucher"
)
redbean_collection.business = beanboi_business
redbean_collection.save!
beanboi_business.save!
redbean_collection.photo.attach(io: File.open('app/assets/images/collection_img/redbeancollectionprofile.avif'), filename: "redbeancollectionprofile.avif", content_type: "image/avif")
redbean_collection.banner.attach(io: File.open('app/assets/images/banner_img/redbeancollectionbanner.png'), filename: "redbeancollectionbanner.png", content_type: "image/avif")

orangebean_collection = Collection.new(
  name: "Orange Beans",
  description: "Free admission to our beanboi gallery!",
  category: "Ticket"
)
orangebean_collection.business = beanboi_business
orangebean_collection.save!
beanboi_business.save!
orangebean_collection.photo.attach(io: File.open('app/assets/images/collection_img/orangebeancollectionprofile.avif'), filename: "orangebeancollectionprofile.avif", content_type: "image/avif")
orangebean_collection.banner.attach(io: File.open('app/assets/images/banner_img/orangebeancollectionbanner.png'), filename: "orangebeancollectionbanner.png", content_type: "image/avif")

p "Created 3 beanboi collections"

#Tokens
token_one = Token.create!(
  address: "80 Raffles Pl, Singapore 048624",
  collection: zodiac_collection,
  description: "Zodiac Inspired Digital Art!",
  conditions: "NFTs created by Z Studio are unique and non-interchangeable units of data stored on a digital ledger (blockchain).",
  user: studio_user
)
token_one.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken1.avif'), filename: "zodiactoken1.avif", content_type: "image/avif")

token_two = Token.create!(
  address: "1 Fullerton Rd, Singapore 049213",
  collection: zodiac_collection,
  description: "Zodiac Inspired Digital Art!",
  conditions: "NFTs created by Z Studio are unique and non-interchangeable units of data stored on a digital ledger (blockchain).",
  user: studio_user
)
token_two.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken2.avif'), filename: "zodiactoken2.avif", content_type: "image/avif")

token_three = Token.create!(
  address: "88 Market St, Singapore 048948",
  description: "Zodiac Inspired Digital Art!",
  conditions: "NFTs created by Z Studio are unique and non-interchangeable units of data stored on a digital ledger (blockchain).",
  collection: zodiac_collection
)
token_three.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken3.avif'), filename: "zodiactoken3.avif", content_type: "image/avif")

token_four = Token.create!(
  address: "2 Battery Rd, Singapore 049908",
  description: "Zodiac Inspired Digital Art!",
  conditions: "NFTs created by Z Studio are unique and non-interchangeable units of data stored on a digital ledger (blockchain).",
  collection: zodiac_collection
)
token_four.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken4.avif'), filename: "zodiactoken4.avif", content_type: "image/avif")

token_five = Token.create!(
  address: "11 Collyer Quay, Singapore 049317",
  description: "Zodiac Inspired Digital Art!",
  conditions: "NFTs created by Z Studio are unique and non-interchangeable units of data stored on a digital ledger (blockchain).",
  collection: zodiac_collection
)
token_five.photo.attach(io: File.open('app/assets/images/token_img/zodiactoken5.avif'), filename: "zodiactoken5.avif", content_type: "image/avif")

token_six = Token.create!(
  address: "5 Stadium Walk, Singapore 397693",
  description: "Zodiac Inspired Digital Art!",
  collection: swolebros_collection,
  user: gym_user
)
token_six.photo.attach(io: File.open('app/assets/images/token_img/swoletoken1.avif'), filename: "swoletoken1.avif", content_type: "image/avif")

token_seven = Token.create!(
  address: "80 Collyer Quay, Singapore 049326",
  collection: swolebros_collection,
  user: gym_user
)
token_seven.photo.attach(io: File.open('app/assets/images/token_img/swoletoken2.avif'), filename: "swoletoken2.avif", content_type: "image/avif")

token_eight = Token.create!(
  address: "1 Stadium Pl, Singapore 397628",
  collection: swolebros_collection
)
token_eight.photo.attach(io: File.open('app/assets/images/token_img/swoletoken3.avif'), filename: "swoletoken3.avif", content_type: "image/avif")

token_nine = Token.create!(
  address: "230 Stadium Blvd, Singapore 397799",
  collection: swolebros_collection
)
token_nine.photo.attach(io: File.open('app/assets/images/token_img/swoletoken4.avif'), filename: "swoletoken4.avif", content_type: "image/avif")

token_ten = Token.create!(
  address: "38 Jln Benaan Kapal, Singapore 399635",
  collection: swolebros_collection
)
token_ten.photo.attach(io: File.open('app/assets/images/token_img/swoletoken5.avif'), filename: "swoletoken5.avif", content_type: "image/avif")

##Added beanboi tokens
token_eleven = Token.create!(
  address: "63 Dunlop St, Singapore 209391",
  collection: redbean_collection,
  description: "$5 OFF your next Beanboi purchase!",
  conditions: "Only valid for in-store redemption. Voucher may only be used once. Minimum $20 purchase."
)
token_eleven.photo.attach(io: File.open('app/assets/images/token_img/redbeanboi1.avif'), filename: "redbeanboi1.avif", content_type: "image/avif")

token_twelve = Token.create!(
  address: "5 Dunlop Street, Singapore 209335",
  collection: redbean_collection,
  description: "$5 OFF your next Beanboi purchase!",
  conditions: "Only valid for in-store redemption. Voucher may only be used once. Minimum $20 purchase."
)
token_twelve.photo.attach(io: File.open('app/assets/images/token_img/redbeanboi2.avif'), filename: "redbeanboi2.avif", content_type: "image/avif")

token_thirteen = Token.create!(
  address: "7 Dunlop Street, Singapore 209337",
  collection: greenbean_collection,
  description: "Redeem a FREE Beanboi Plushie!",
  conditions: "Only valid for in-store redemption. Only one redemption per NFT. While stocks last, subject to availability."
)
token_thirteen.photo.attach(io: File.open('app/assets/images/token_img/greenbeanboi1.avif'), filename: "greenbeanboi1.avif", content_type: "image/avif")

token_fourteen = Token.create!(
  address: "45 Dunlop St, Singapore 209374",
  collection: greenbean_collection,
  description: "Redeem a FREE Beanboi Plushie!",
  conditions: "Only valid for in-store redemption. Only one redemption per NFT. While stocks last, subject to availability.",
  user: beanboi_user
)
token_fourteen.photo.attach(io: File.open('app/assets/images/token_img/greenbeanboi2.avif'), filename: "greenbeanboi2.avif", content_type: "image/avif")

token_fifteen = Token.create!(
  address: "36 Dunlop St, Singapore 209364",
  collection: orangebean_collection,
  description: "FREE admission to Beanboi Gallery!",
  conditions: "This NFT admits only ONE. Beanboi management has right to restrict entry at their discretion.",
  user: beanboi_user
)
token_fifteen.photo.attach(io: File.open('app/assets/images/token_img/orangebeanboi1.avif'), filename: "orangebeanboi1.avif", content_type: "image/avif")

token_sixteen = Token.create!(
  address: "63 Dunlop St, Singapore 209391",
  collection: orangebean_collection,
  description: "FREE admission to Beanboi Gallery!",
  conditions: "This NFT admits only ONE. Beanboi management has right to restrict entry at their discretion."
)
token_sixteen.photo.attach(io: File.open('app/assets/images/token_img/orangebeanboi2.avif'), filename: "orangebeanboi2.avif", content_type: "image/avif")

p "16 tokens generated"
