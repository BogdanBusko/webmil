user1 = User.create!(email: 'busko.bogdan@gmail.com', password: '123456')
user2 = User.create!(email: 'example@gmail.com', password: '123456')

10.times do
  link = Link.new(
    url: Faker::Internet.domain_name,
    description: Faker::Lorem.paragraph,
    user_id: user1.id
  )

  link.format_tag(Faker::Internet.domain_name)

  link.save!
end

10.times do
  link = Link.new(
    url: Faker::Internet.domain_name,
    description: Faker::Lorem.paragraph,
    user_id: user2.id
  )

  link.format_tag(Faker::Internet.domain_name)

  link.save!
end
