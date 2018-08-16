namespace :utils do
  desc "Populating database with dummy data"
  task seed: :environment do

    puts 'Creating contacts...'
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name ,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)
      )
    end
    puts 'Creating contacts...[OK]'

    puts 'Creating addresses...'
    10.times do |i|
      Address.create!(
        street: Faker::Address.full_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        contact: Contact.all.sample
      )
    end
    puts 'Creating addresses...[OK]'

    puts 'Creating phones...'
    10.times do |i|
      Phone.create!(
        phone: Faker::PhoneNumber.phone_number,
        contact: Contact.all.sample
      )
    end
    puts 'Creating phones...[OK]'
    puts 'Populating database...[OK]'
  end
end
