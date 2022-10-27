namespace :dev do
  desc "Generate a basic dev setup"
  task setup: :environment do
    puts 'Generation user roles...'

    admin_role = Role.create!(name: 'super_admin')
    user_role = Role.create!(name: 'user')

    puts 'Generating a super_admin user...'

    User.create(role: admin_role,
                name: Faker::Name.name,
                email: Faker::Internet.email,
                phone: Faker::PhoneNumber.cell_phone,
                address: Faker::Address.full_address,
                birthdate: Faker::Date.between(from: '1970-01-01', to: '2002-01-01'),
                password: Faker::Internet.password)
    
    puts 'Generating standard users...'

    100.times do |i|
      User.create(role: user_role,
                name: Faker::Name.name,
                email: Faker::Internet.email,
                phone: Faker::PhoneNumber.cell_phone,
                address: Faker::Address.full_address,
                birthdate: Faker::Date.between(from: '1970-01-01', to: '2002-01-01'),
                password: Faker::Internet.password)
    end

    
  end
end
