10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
end

5.times do 
  Category.create(title: Faker::Commerce.department)
end

items = Item.all
counter = 0
Category.all.each do |category| 
  first_item = items[counter]
  second_item = items[counter+1]

  first_item.category = category
  second_item.category = category

  first_item.save
  second_item.save
  counter+=2
end

3.times do 
  User.create(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end
