authors = []
10.times do
  authors << Author.create!(
    name: "Author #{rand(1..100)}",
    cid: rand(1000..9999),
    date_of_birth: Date.new(rand(1950..2000), rand(1..12), rand(1..28))
  )
end

10.times do
  Book.create!(
    title: "Book Title #{rand(1..100)}",
    sl_no: rand(10000..99999),
    publish_year: rand(1900..2023),
    price: rand(5..100),
    author: authors.sample
  )
end
