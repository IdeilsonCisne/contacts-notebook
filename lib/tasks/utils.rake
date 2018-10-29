namespace :utils do
  desc "Populating database with dummy data"
  task seed: :environment do

    puts 'Creating contacts...'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name ,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
      )
    end
    puts 'Creating contacts...[OK]'

    puts 'Creating addresses...'
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.full_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        contact: contact
      )
    end
    puts 'Creating addresses...[OK]'

    puts 'Creating phones...'
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          phone: Faker::PhoneNumber.phone_number,
          contact: contact
        )
      end
    end
    puts 'Creating phones...[OK]'
    puts 'Populating database...[OK]'
  end
end
