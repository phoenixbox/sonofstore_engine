# Encoding: UTF-8
require 'faker'

####
#ROLES
%w[store_admin, stocker_admin, super_admin].each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

#####
#STORES

store_rue_copine = Store.create(name: "Rue Copine", path: "rue_copine")
store_tactical_assets = Store.create(name: "Tactical Assets", path: "tactical_assets")
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

user_rue_copine = User.create(:full_name => "Mathilde Nguyen", email: 'mathilde@ruecopine.fr', :store_id => store_rue_copine.id,
                              password: "password", password_confirmation: "password", display_name: "Mathilde")
user_rue_copine.add_role :store_admin

user_tactical_assets = User.create(full_name: "Jack Danger", email: 'jack@tacticalassets.com', store_id: store_tactical_assets.id,
                                   password: "password", password_confirmation: "password", display_name: "Jack")
user_tactical_assets.add_role :store_admin
user1 = User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
user2 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
user3 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

user4 = User.create(full_name: "Professor X", email: "admin@example.com", password: "password")
user4.add_role :super_admin

user5 = User.create(full_name: "Wolverine", email: "wolverine@example.com", password: "password", store_id: 4)
user5.add_role :store_admin

user6 = User.create(full_name: "Ironman", email: "ironmanw@example.com", password: "password", store_id: 5)
user6.add_role :store_admin

user7 = User.create(full_name: "Batman", email: "batman@example.com", password: "password", store_id: 6)
user7.add_role :store_admin

user8 = User.create(full_name: "Magneto", email: "magneto@example.com", password: "password")



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

products = [{title: "Robe", description: "Tres beau robe.", created_at: "2013-04-17 20:32:26", updated_at: "2013-04-17 20:32:26", active: true, price: 23700, photo_file_name: "27176007_066_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 13760, photo_updated_at: "2013-04-17 20:32:26", slug: nil, store_id: 1, photo_url: nil},
            {title: "Dress", description: "Dress", created_at: "2013-04-17 20:39:19", updated_at: "2013-04-17 20:39:19", active: true, price: 10000, photo_file_name: "26543728_011_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11467, photo_updated_at: "2013-04-17 20:39:19", slug: nil, store_id: 1, photo_url: nil},
            {title: "Dress1", description: "Dress", created_at: "2013-04-17 20:41:14", updated_at: "2013-04-17 20:41:14", active: true, price: 10000, photo_file_name: "27195247_030_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11209, photo_updated_at: "2013-04-17 20:41:14", slug: nil, store_id: 1, photo_url: nil},
            {title: "Dress du soir", description: "Dress", created_at: "2013-04-17 20:42:05", updated_at: "2013-04-17 20:42:05", active: true, price: 10000, photo_file_name: "27693563_001_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 9581, photo_updated_at: "2013-04-17 20:42:05", slug: nil, store_id: 1, photo_url: nil},
            {title: "Dress du tennis", description: "Dress", created_at: "2013-04-17 20:43:04", updated_at: "2013-04-17 20:43:04", active: true, price: 10000, photo_file_name: "26750646_049_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 14692, photo_updated_at: "2013-04-17 20:43:04", slug: nil, store_id: 1, photo_url: nil},
            {title: "Le jouer", description: "Dress", created_at: "2013-04-17 20:43:50", updated_at: "2013-04-17 20:43:50", active: true, price: 10000, photo_file_name: "26913103_069_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 24783, photo_updated_at: "2013-04-17 20:43:50", slug: nil, store_id: 1, photo_url: nil},
            {title: "Robe cocktail", description: "Robe", created_at: "2013-04-17 20:44:31", updated_at: "2013-04-17 20:44:31", active: true, price: 10000, photo_file_name: "27020114_008_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 14546, photo_updated_at: "2013-04-17 20:44:31", slug: nil, store_id: 1, photo_url: nil},
            {title: "L'Université d'attirance", description: "Robe", created_at: "2013-04-17 20:45:31", updated_at: "2013-04-17 20:45:31", active: true, price: 10000, photo_file_name: "27413905_050_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11631, photo_updated_at: "2013-04-17 20:45:31", slug: nil, store_id: 1, photo_url: nil},
            {title: "Chic en été", description: "Robe", created_at: "2013-04-17 20:46:21", updated_at: "2013-04-17 20:46:21", active: true, price: 10000, photo_file_name: "27612688_040_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11323, photo_updated_at: "2013-04-17 20:46:21", slug: nil, store_id: 1, photo_url: nil},
            {title: "La nouba", description: "Robe", created_at: "2013-04-17 20:47:21", updated_at: "2013-04-17 20:47:21", active: true, price: 10000, photo_file_name: "27967447_009_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 9723, photo_updated_at: "2013-04-17 20:47:21", slug: nil, store_id: 1, photo_url: nil},
            {title: "Vacances copine", description: "Robe", created_at: "2013-04-17 20:48:16", updated_at: "2013-04-17 20:48:16", active: true, price: 10000, photo_file_name: "26986604_041_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 15885, photo_updated_at: "2013-04-17 20:48:16", slug: nil, store_id: 1, photo_url: nil},
            {title: "Séreneté", description: "Robe", created_at: "2013-04-17 20:49:23", updated_at: "2013-04-17 20:49:23", active: true, price: 10000, photo_file_name: "26567602_049_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 15976, photo_updated_at: "2013-04-17 20:49:23", slug: nil, store_id: 1, photo_url: nil},
            {title: "Une nuit en Inde", description: "Robe", created_at: "2013-04-17 20:50:14", updated_at: "2013-04-17 20:50:14", active: true, price: 10000, photo_file_name: "27293976_041_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 14010, photo_updated_at: "2013-04-17 20:50:14", slug: nil, store_id: 1, photo_url: nil},
            {title: "L'italienne", description: "Robe", created_at: "2013-04-17 20:51:03", updated_at: "2013-04-17 20:51:03", active: true, price: 10000, photo_file_name: "27861673_040_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 12401, photo_updated_at: "2013-04-17 20:51:03", slug: nil, store_id: 1, photo_url: nil},
            {title: "En fôret", description: "Robe", created_at: "2013-04-17 20:52:54", updated_at: "2013-04-17 21:24:17", active: true, price: 10000, photo_file_name: "27856467_102_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 53380, photo_updated_at: "2013-04-17 21:24:17", slug: nil, store_id: 1, photo_url: nil},
            {title: "Le Lendemain", description: "Jolie robe", created_at: "2013-04-17 21:23:07", updated_at: "2013-04-17 21:23:07", active: true, price: 10000, photo_file_name: "26973883_041_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 13282, photo_updated_at: "2013-04-17 21:23:07", slug: nil, store_id: 1, photo_url: nil}]
products.each do |p|
  Product.create(p)
end

