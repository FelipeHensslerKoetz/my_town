namespace :dev do
  desc "Generate a basic dev setup"
  task setup: :environment do
    puts 'Generation user roles...'

    Role.create!(name: 'super_admin')
    Role.create!(name: 'user')

    puts 'ok'
  end
end
