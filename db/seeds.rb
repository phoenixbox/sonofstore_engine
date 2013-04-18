require 'faker'
# require 'faker'

# ####
# #ROLES
# %w[store_admin, stocker_admin, super_admin].each do |role|
#   Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#   puts 'role: ' << role
# end

# #####
# #STORES

# store1 = Store.create(name: "Mustaches", path: "mustaches")
# store2 = Store.create(name: "Hats", path: "hats")
# store3 = Store.create(name: "Glasses", path: "glasses")
# store4 = Store.create(name: "Xmen", path: "xmen")
# store5 = Store.create(name: "Avengers", path: "avengers")
# store6 = Store.create(name: "League of Shadows", path: "Ras al-Ghul")
# store7 = Store.create(name: "The Sons of Anarchy", path: "Jax Teller")
# store8 = Store.create(name: "The Three Musketeers", path: "D'Artagnon")
# store9 = Store.create(name: "Batman", path: "Bruce Wayne")
# store10 = Store.create(name: "Superman", path: "Clark Kent")

# #####
# #USERS

# user1 = User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
#             password: "password", password_confirmation: "password")
# user2 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
#             password: "password", password_confirmation: "password", display_name: "j3")
# user3 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
#             password: "password", password_confirmation: "password", display_name: "SkrilleX")

# user4 = User.create(full_name: "Professor X", email: "admin@example.com", password: "password")
# user4.add_role :super_admin

# user5 = User.create(full_name: "Wolverine", email: "wolverine@example.com", password: "password", store_id: 4)
# user5.add_role :store_admin

# user6 = User.create(full_name: "Ironman", email: "ironmanw@example.com", password: "password", store_id: 5)
# user6.add_role :store_admin

# user7 = User.create(full_name: "Batman", email: "batman@example.com", password: "password", store_id: 6)
# user7.add_role :store_admin

# user8 = User.create(full_name: "Magneto", email: "magneto@example.com", password: "password")

# 10_000.times do |i|
#   User.create(full_name: "FakerName"+"#{i}", email: "faker@"+"#{rand(1..100000000)}", password: "password")
# end
# [store1,store2,store3,store4,store5,store6,store7,store8,store9,store10].each do |s|
#   10_001.times do |int|
   
#     Product.create(title: "#{Faker::Lorem.words(2).join.to_s}"+"#{rand(1..10000000000)}"+"#{rand(1..100000000000)}",
#                     description: "#{Faker::Lorem.words(3).join.to_s}",
#                     price_in_dollars: rand(1..int),
#                     store_id: s.id, :photo_url => "http://store-engine.s3.amazonaws.com/products/photos/000/000/027/original/blue_ball_pack.jpg")
#   end 

#   10.times do |i|
#     Category.create(:name => "category"+"#{s.id}"+"#{rand(1..100000000)}", :store_id => s.id)
#   end

#   10.times do |i|
#     ProductCategory.create(product_id: (Store.find_by_id(s.id).products.first.id), category_id: i)
#   end
# end


store1 = Store.create(name: "Xmen", path: "xmen", description: "all things xmen", status: "pending")
store2 = Store.create(name: "Avengers", path: "avengers", description: "all things avengers", status: "online")
store3 = Store.create(name: "Justice League", path: "justice-league", description: "all things justice league", status: "online")


#####
#STORES

store1 = Store.create(name: "Mustaches", path: "mustaches")
store2 = Store.create(name: "Hats", path: "hats")
store3 = Store.create(name: "Glasses", path: "glasses")
store4 = Store.create(name: "Xmen", path: "xmen")
store5 = Store.create(name: "Avengers", path: "avengers")
store6 = Store.create(name: "League of Shadows", path: "Ras al-Ghul")
store7 = Store.create(name: "The Sons of Anarchy", path: "Jax Teller")
store8 = Store.create(name: "The Three Musketeers", path: "D'Artagnon")
store9 = Store.create(name: "Batman", path: "Bruce Wayne")
store10 = Store.create(name: "Superman", path: "Clark Kent")

#####
#USERS

user1 = User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
user2 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
user3 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

user4 = User.create(full_name: "Professor X", email: "admin@example.com", password: "password")
user5 = User.create(full_name: "Wolverine", email: "wolverine@example.com", password: "password")
user6 = User.create(full_name: "Ironman", email: "ironmanw@example.com", password: "password")
user7 = User.create(full_name: "Batman", email: "batman@example.com", password: "password")
user8 = User.create(full_name: "Magneto", email: "magneto@example.com", password: "password")
user4.assign_super_admin

UserStoreRole.create({user_id: 5, store_id: 1, role: 'admin'})
UserStoreRole.create({user_id: 6, store_id: 2, role: 'stocker'})
UserStoreRole.create({user_id: 7, store_id: 3, role: 'admin'})

10_000.times do |i|
  User.create(full_name: "FakerName"+"#{i}", email: "faker@"+"#{rand(1..100000000)}", password: "password")
end
[store1,store2,store3,store4,store5,store6,store7,store8,store9,store10].each do |s|
  10_001.times do |int|

    Product.create(title: "#{Faker::Lorem.words(2).join.to_s}"+"#{rand(1..10000000000)}"+"#{rand(1..100000000000)}",
                    description: "#{Faker::Lorem.words(3).join.to_s}",
                    price_in_dollars: rand(1..int),
                    store_id: s.id, :photo_url => "http://store-engine.s3.amazonaws.com/products/photos/000/000/027/original/blue_ball_pack.jpg")
  end

  10.times do |i|
    Category.create(:name => "category"+"#{s.id}"+"#{rand(1..100000000)}", :store_id => s.id)
  end

  10.times do |i|
    ProductCategory.create(product_id: (Store.find_by_id(s.id).products.first.id), category_id: i)
  end
end
