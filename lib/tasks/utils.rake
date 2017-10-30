namespace :utils do
  desc "Popular Banco de Dados"
  task seed: :environment do
    puts "Creating Contact..."
    100.times do |i|
        Contact.create!(name: Faker::Name.name,
                        email: Faker::Internet.email,
                        kind: Kind.all.sample,
                        rmk: Faker::Lorem.paragraph([1,2,3].sample)
        )
    end
    puts "Contacts created [OK]"

    puts "Creating Addresses..."
    Contact.all.each do |contact|
        Address.create!(street: Faker::Address.street_name,
                        city: Faker::Address.city,
                        state: Faker::Address.state_abbr,
                        contact: contact
        )
    end
    puts "Addresses created [OK]"

    puts "Creating Phones..."
    Contact.all.each do |contact|
      Random.rand(1..3).times do |i|
        Phone.create!(phone: Faker::PhoneNumber.phone_number ,
                      contact: contact
        )
      end
    end
    puts "Phones created [OK]"

  end

end