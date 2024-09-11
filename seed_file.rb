#
100.times do
  Author.create(name: Faker::Book.author)
end

100.times do
  Publisher.create(name: Faker::Book.author)
end

100.times do
  Genre.create(name: Faker::Book.genre)
end

[].tap do |arr|
  10_000.times do
  time = Time.current
  arr < {
    title: Faker.Book.title,
    author_id: 1 + rand(100),
    publisher_id: 1 + rand(100),
    genre_id: 1 + rand(100),
    updated_at: time,
    created_at: time
  }
  end
  Book.insert_all(arr)
end

# time rails db:seed
#
#sample