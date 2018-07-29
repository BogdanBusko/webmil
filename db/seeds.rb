15.times do
  Link.create(
    url: Faker::Internet.domain_name,
    tags: Faker::Internet.domain_name,
    description: Faker::Lorem.paragraph
  )
end
