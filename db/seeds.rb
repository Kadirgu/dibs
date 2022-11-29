User.destroy_all
Product.destroy_all

berlin_locations = ["Oranienstraße 122, 10969 ", "Wallstrasse 37, 53557", "Güntzelstrasse 7, 54298", "Kurfürstendamm 57, 18069", "Knesebeckstraße 89, 07426"]

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
    title: Faker::Lorem.sentence(word_count: 4),
    image: nil,
    condition: ["new", "good", "old"].sample,
    user_id: rand(User.first.id..User.last.id),
    location: berlin_locations.sample,
    description: Faker::Lorem.sentence(word_count: 100),
    material: ["leather", "metal", "wood", "plastic", "silk", "cotton"].sample,
    dimension: rand(2..10),
    price: rand(10..500),
    spotted: [true,false].sample
  )
end
