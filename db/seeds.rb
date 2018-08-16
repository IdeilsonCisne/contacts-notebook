# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Populando banco de dados...'
Kind.create!([
  {description: "Amigo"},
  {description: "Colega"},
  {description: "Familía"}
  ])

10.times do |contact|
  Contact.create!(
    name: Faker::Name.name ,
    email: Faker::Internet.email,
    kind_id: Kind.all.sample,
    rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
  )
end
puts 'Populando banco de dados...[OK]'
