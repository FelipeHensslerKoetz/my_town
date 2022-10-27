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

    puts 'Generation posts...'

    users = User.where(role: user_role)

    users.each do |user| 
      Post.create!(user: user,
                   title: Faker::Lorem.word,
                   category: 'security',
                   description: Faker::Lorem.paragraph(sentence_count: 50),
                   address: Faker::Address.full_address)
    end

    puts 'Genereating comments...'

    Post.all.each do |post|
      user = users.sample 

      Comment.create!(user: user, post: post, description: Faker::Lorem.paragraph(sentence_count: 3))
    end
  end
end
