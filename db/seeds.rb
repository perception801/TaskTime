require 'faker'

8.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

20.times do
  list = List.create!(
    name:          Faker::Commerce.department,
    description:  Faker::Lorem.sentence,
    user:         users.sample
  )
  list.save!
end
lists = List.all

40.times do
  item = Item.new(

    name:   Faker::Commerce.product_name,
    list:   lists.sample,
    )
item.save!
end
items = Item.all






puts "#{users.count} users seeded."
puts "#{lists.count} lists seeded."
puts "#{items.count} items seeded."