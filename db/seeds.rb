# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PICTURE_URLS = [
  "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80",
  "https://images.unsplash.com/photo-1576941089067-2de3c901e126?ixlib=rb-1.2.1&auto=format&fit=crop&w=1443&q=80",
  "https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1502005097973-6a7082348e28?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"

]

puts "Flat.destroy_all"
Flat.destroy_all

def create_and_save_flat
  puts "Flat.new"
  flat = Flat.new(
    name: Faker::Name.name,
    address: Faker::Company.bs,
    description: Faker::Company.bs,
    price_per_night: Random.rand(11..1000),
    number_of_guest: Random.rand(0..30),
    picture_url: PICTURE_URLS.sample(1)[0]
    )
  puts "flat.save"
  flat.save
  puts "flat saved : #{flat}"
end

7.times { create_and_save_flat }
