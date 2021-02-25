10.times do
  Customer.create first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    title: FFaker::Name.name,
    email: FFaker::Internet.email,
    visits: 0, orders_count: 0, lock_version: 0
end

10.times do
  Author.create first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    title: FFaker::Book.author
end

5.times do
  Supplier.create name: FFaker::Company.name
end

20.times do
  Book.create title: FFaker::Book.title,
    isbn: FFaker::Book.isbn,
    year_published: rand(1999..2021),
    price: rand(5..1000), out_of_printeger: [true, false].sample,
    supplier_id: Supplier.ids.sample,
    author_id: Author.ids.sample
end

15.times do
  Review.create title: FFaker::Lorem.sentence,
    body: FFaker::Lorem.paragraph,
    rating: rand(1..5),
    state: Review.statuses.values.sample,
    customer_id: Customer.ids.sample,
    book_id: Book.ids.sample
end

30.times do
    order = Order.create date_submitted: FFaker::Lorem.sentence,
      status: Order.statuses.values.sample,
      shipping: rand(0..10),
      customer_id: Book.ids.sample
    rand(1..3).times do
      BookOrder.create order_id: order.id,
        book_id: Book.ids.sample
    end
    subtotal = order.books.sum(:price)
    tax = subtotal * 0.1
    total = subtotal - tax - order.shipping
    order.update subtotal: subtotal, tax: tax, total: total
end
