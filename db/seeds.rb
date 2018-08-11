User.create!(email: 'busko.bogdan@gmail.com', password: '123456', role: :admin)
User.create!(email: 'example@gmail.com', password: '123456', role: :user)

User.each do |user|
  10.times do
    link = Link.new(
      url: Faker::Internet.domain_name,
      description: Faker::Lorem.paragraph,
      user_id: user.id
    )

    link.tags = ''
    Faker::Number.between(1, 10).times do
      link.tags += Faker::Lorem.word + ' '
    end

    link.save
  end
end
