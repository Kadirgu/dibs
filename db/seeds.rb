Favorite.destroy_all
Product.destroy_all
User.destroy_all

berlin_locations = ["Oranienstraße 122, 10969", "Wallstrasse 37, 53557", "Güntzelstrasse 7, 54298", "Kurfürstendamm 57, 18069", "Knesebeckstraße 89, 07426"]

User.create(
  email: "jenny@gmail.com",
  first_name: "jenny",
  last_name: "chacon",
  password: "123456"
)

10.times do
  User.create(
    email: "#{Faker::Name.first_name}@gmail.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: "123456"
  )
end

20.times do
  Product.create(
    title: Faker::House.furniture,
    category: ["Kitchen", "Living Room", "Office", "Bathroom", "Bedroom", "Dining Room", "Garden", "Other"].sample,
    condition: ["New", "Good", "Old"].sample,
    user_id: rand(User.first.id..User.last.id),
    location: berlin_locations.sample,
    description: Faker::Lorem.sentence(word_count: 50),
    material: ["Leather", "Metal", "Wood", "Plastic", "Silk", "Cotton"].sample,
    dimension: rand(2..10),
    price: rand(10..500).round(2),
    spotted: [true,false].sample
  )
end

# users = User.all
# products = Product.all

# users.each do |u|
#   products.sample(3) do |p|
#     Favorite.create!(user_id: u.id, product_id: p.id)
#   end
# end

user = User.create(
  email: "#{Faker::Name.first_name}@gmail.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "123456"
)

product = Product.create!(
  title: Faker::Lorem.sentence(word_count: 4),
  condition: ["New", "Good", "Old"].sample,
  user_id: rand(User.first.id..User.last.id),
  location: berlin_locations.sample,
  description: Faker::Lorem.sentence(word_count: 50),
  material: ["Leather", "Metal", "Wood", "Plastic", "Silk", "Cotton"].sample,
  dimension: rand(2..10),
  price: rand(10..500),
  spotted: [true,false].sample
)

Favorite.create!(
  user_id: user.id,
  product_id: product.id
)
