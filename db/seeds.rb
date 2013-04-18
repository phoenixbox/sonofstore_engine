# Encoding: UTF-8
require 'faker'

#####
#STORES

store_rue_copine = Store.create(name: "Rue Copine", path: "rue_copine", description: 'La mode française')
store_rue_copine.status = 'online'
store_rue_copine.save

store_tactical_assets = Store.create(name: "Tactical Assets", path: "tactical_assets", description: 'Man tools')
store_tactical_assets.status = 'online'
store_tactical_assets.save

store_moda_peligrosa = Store.create(name: "Moda Peligrosa", path: 'moda_peligrosa', description: "Dangerous fashion")
store_moda_peligrosa.status = 'online'

# store3 = Store.create(name: "Glasses", path: "glasses")
# store4 = Store.create(name: "Xmen", path: "xmen")
# store5 = Store.create(name: "Avengers", path: "avengers")
# store6 = Store.create(name: "League of Shadows", path: "Ras al-Ghul")
# store7 = Store.create(name: "The Sons of Anarchy", path: "Jax Teller")
# store8 = Store.create(name: "The Three Musketeers", path: "D'Artagnon")
# store9 = Store.create(name: "Batman", path: "Bruce Wayne")
# store10 = Store.create(name: "Superman", path: "Clark Kent")

#####
#USERS


user_rue_copine = User.create(:full_name => "Mathilde Nguyen", email: 'mathilde@ruecopine.fr',
                              password: "password", password_confirmation: "password", display_name: "Mathilde")
stocker_rue_copine = User.create(:full_name => "Jacque d'Angers", email: 'jacque@ruecopine.fr',
                              password: "password", password_confirmation: "password", display_name: "Jacque")
UserStoreRole.create({user_id: user_rue_copine.id, store_id: store_rue_copine.id, role: 'admin'})
UserStoreRole.create({user_id: stocker_rue_copine.id, store_id: store_rue_copine.id, role: 'stocker'})


user_tactical_assets = User.create(full_name: "Jack Danger", email: 'jack@tacticalassets.com',
                                   password: "password", password_confirmation: "password", display_name: "Jack")
stocker_tactical_assets = User.create(full_name: "Mike Danger", email: 'mike@tacticalassets.com',
                                   password: "password", password_confirmation: "password", display_name: "Mike")

UserStoreRole.create({user_id: user_tactical_assets.id, store_id: store_tactical_assets.id, role: 'admin'})
UserStoreRole.create({user_id: stocker_tactical_assets.id, store_id: store_tactical_assets.id, role: 'stocker'})

user1 = User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
user2 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
user3 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

user4 = User.create(full_name: "Professor X", email: "admin@example.com", password: "password")
user4.super_admin = true
user4.save

user5 = User.create(full_name: "Wolverine", email: "wolverine@example.com", password: "password")

user6 = User.create(full_name: "Ironman", email: "ironmanw@example.com", password: "password")

user7 = User.create(full_name: "Batman", email: "batman@example.com", password: "password")

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

rue_copine_products = [{title: "Robe", description: "Tres beau robe.", created_at: "2013-04-17 20:32:26", updated_at: "2013-04-17 20:32:26", active: true, price: 23700, photo_file_name: "27176007_066_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 13760, photo_updated_at: "2013-04-17 20:32:26", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Dress", description: "Dress", created_at: "2013-04-17 20:39:19", updated_at: "2013-04-17 20:39:19", active: true, price: 10000, photo_file_name: "26543728_011_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11467, photo_updated_at: "2013-04-17 20:39:19", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Dress1", description: "Dress", created_at: "2013-04-17 20:41:14", updated_at: "2013-04-17 20:41:14", active: true, price: 10000, photo_file_name: "27195247_030_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11209, photo_updated_at: "2013-04-17 20:41:14", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Dress du soir", description: "Dress", created_at: "2013-04-17 20:42:05", updated_at: "2013-04-17 20:42:05", active: true, price: 10000, photo_file_name: "27693563_001_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 9581, photo_updated_at: "2013-04-17 20:42:05", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Dress du tennis", description: "Dress", created_at: "2013-04-17 20:43:04", updated_at: "2013-04-17 20:43:04", active: true, price: 10000, photo_file_name: "26750646_049_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 14692, photo_updated_at: "2013-04-17 20:43:04", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Le jouer", description: "Dress", created_at: "2013-04-17 20:43:50", updated_at: "2013-04-17 20:43:50", active: true, price: 10000, photo_file_name: "26913103_069_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 24783, photo_updated_at: "2013-04-17 20:43:50", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Robe cocktail", description: "Robe", created_at: "2013-04-17 20:44:31", updated_at: "2013-04-17 20:44:31", active: true, price: 10000, photo_file_name: "27020114_008_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 14546, photo_updated_at: "2013-04-17 20:44:31", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "L'Université d'attirance", description: "Robe", created_at: "2013-04-17 20:45:31", updated_at: "2013-04-17 20:45:31", active: true, price: 10000, photo_file_name: "27413905_050_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11631, photo_updated_at: "2013-04-17 20:45:31", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Chic en été", description: "Robe", created_at: "2013-04-17 20:46:21", updated_at: "2013-04-17 20:46:21", active: true, price: 10000, photo_file_name: "27612688_040_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 11323, photo_updated_at: "2013-04-17 20:46:21", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "La nouba", description: "Robe", created_at: "2013-04-17 20:47:21", updated_at: "2013-04-17 20:47:21", active: true, price: 10000, photo_file_name: "27967447_009_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 9723, photo_updated_at: "2013-04-17 20:47:21", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Vacances copine", description: "Robe", created_at: "2013-04-17 20:48:16", updated_at: "2013-04-17 20:48:16", active: true, price: 10000, photo_file_name: "26986604_041_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 15885, photo_updated_at: "2013-04-17 20:48:16", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Séreneté", description: "Robe", created_at: "2013-04-17 20:49:23", updated_at: "2013-04-17 20:49:23", active: true, price: 10000, photo_file_name: "26567602_049_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 15976, photo_updated_at: "2013-04-17 20:49:23", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Une nuit en Inde", description: "Robe", created_at: "2013-04-17 20:50:14", updated_at: "2013-04-17 20:50:14", active: true, price: 10000, photo_file_name: "27293976_041_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 14010, photo_updated_at: "2013-04-17 20:50:14", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "L'italienne", description: "Robe", created_at: "2013-04-17 20:51:03", updated_at: "2013-04-17 20:51:03", active: true, price: 10000, photo_file_name: "27861673_040_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 12401, photo_updated_at: "2013-04-17 20:51:03", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "En fôret", description: "Robe", created_at: "2013-04-17 20:52:54", updated_at: "2013-04-17 21:24:17", active: true, price: 10000, photo_file_name: "27856467_102_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 53380, photo_updated_at: "2013-04-17 21:24:17", slug: nil, store_id: store_rue_copine.id, photo_url: nil},
            {title: "Le Lendemain", description: "Jolie robe", created_at: "2013-04-17 21:23:07", updated_at: "2013-04-17 21:23:07", active: true, price: 10000, photo_file_name: "26973883_041_b.jpeg", photo_content_type: "image/jpeg", photo_file_size: 13282, photo_updated_at: "2013-04-17 21:23:07", slug: nil, store_id: store_rue_copine.id, photo_url: nil}]
rue_copine_products.each do |p|
  Product.create(p)
end

tactical_assets_products = [{title: "MP7-A1", description: "Assault Rifle", created_at: "2013-04-18 00:21:09", updated_at: "2013-04-18 00:21:09", active: true, price: 200000, photo_file_name: "lg_mp7a1_3.jpg", photo_content_type: "image/jpeg", photo_file_size: 13533, photo_updated_at: "2013-04-18 00:21:09", slug: nil, store_id: 2, photo_url: nil},
                            {title: "MP7-A1 w/ Silencer", description: "Silenced Assault Rifle", created_at: "2013-04-18 00:23:14", updated_at: "2013-04-18 00:23:14", active: true, price: 260000, photo_file_name: "lg_mp7a1_4.jpg", photo_content_type: "image/jpeg", photo_file_size: 23565, photo_updated_at: "2013-04-18 00:23:14", slug: nil, store_id: 2, photo_url: nil},
                            {title: "UMP-4", description: "Sub-compact Assault Rifle", created_at: "2013-04-18 00:24:05", updated_at: "2013-04-18 00:24:05", active: true, price: 160000, photo_file_name: "lg_ump_4.jpg", photo_content_type: "image/jpeg", photo_file_size: 16475, photo_updated_at: "2013-04-18 00:24:05", slug: nil, store_id: 2, photo_url: nil},
                            {title: "UMP-3", description: "Sub-compact Assault Rifle", created_at: "2013-04-18 00:24:44", updated_at: "2013-04-18 00:24:44", active: true, price: 140000, photo_file_name: "lg_ump_3.jpg", photo_content_type: "image/jpeg", photo_file_size: 18739, photo_updated_at: "2013-04-18 00:24:44", slug: nil, store_id: 2, photo_url: nil},
                            {title: "MP5 SF", description: "Sub-com battle rifle", created_at: "2013-04-18 00:25:29", updated_at: "2013-04-18 00:25:29", active: true, price: 240000, photo_file_name: "lg_mp5sf.jpg", photo_content_type: "image/jpeg", photo_file_size: 14389, photo_updated_at: "2013-04-18 00:25:29", slug: nil, store_id: 2, photo_url: nil},
                            {title: "USP", description: ".45 ACP Pistol", created_at: "2013-04-18 00:26:08", updated_at: "2013-04-18 00:26:08", active: true, price: 120000, photo_file_name: "lg_uspc.jpg", photo_content_type: "image/jpeg", photo_file_size: 31583, photo_updated_at: "2013-04-18 00:26:08", slug: nil, store_id: 2, photo_url: nil},
                            {title: "USP-m", description: ".45 ACP Pistol", created_at: "2013-04-18 00:26:48", updated_at: "2013-04-18 00:26:48", active: true, price: 120000, photo_file_name: "lg_usp.jpg", photo_content_type: "image/jpeg", photo_file_size: 27588, photo_updated_at: "2013-04-18 00:26:48", slug: nil, store_id: 2, photo_url: nil},
                            {title: "MP5-k", description: "Interior Security Submachine gun", created_at: "2013-04-18 00:28:59", updated_at: "2013-04-18 00:28:59", active: true, price: 210000, photo_file_name: "lg_mp5k.jpg", photo_content_type: "image/jpeg", photo_file_size: 19833, photo_updated_at: "2013-04-18 00:28:59", slug: nil, store_id: 2, photo_url: nil},
                            {title: "MP5-sd", description: "Anti-terrorim CQB Rifle", created_at: "2013-04-18 00:29:43", updated_at: "2013-04-18 00:29:43", active: true, price: 270000, photo_file_name: "lg_mp5sd.jpg", photo_content_type: "image/jpeg", photo_file_size: 17443, photo_updated_at: "2013-04-18 00:29:43", slug: nil, store_id: 2, photo_url: nil},
                            {title: "PSG A1", description: "Long Range Sniper Rifle 7.62", created_at: "2013-04-18 00:30:38", updated_at: "2013-04-18 00:30:38", active: true, price: 360000, photo_file_name: "lg_psg1a1.jpg", photo_content_type: "image/jpeg", photo_file_size: 12784, photo_updated_at: "2013-04-18 00:30:38", slug: nil, store_id: 2, photo_url: nil},
                            {title: "HK416", description: "Urban Assault Rifle", created_at: "2013-04-18 00:31:58", updated_at: "2013-04-18 00:31:58", active: true, price: 310000, photo_file_name: "lg_hk416.jpg", photo_content_type: "image/jpeg", photo_file_size: 21681, photo_updated_at: "2013-04-18 00:31:58", slug: nil, store_id: 2, photo_url: nil},
                            {title: "HK417", description: "Urban Assault Rifle", created_at: "2013-04-18 00:32:54", updated_at: "2013-04-18 00:32:54", active: true, price: 310000, photo_file_name: "lg_hk417.jpg", photo_content_type: "image/jpeg", photo_file_size: 19563, photo_updated_at: "2013-04-18 00:32:54", slug: nil, store_id: 2, photo_url: nil},
                            {title: "G36", description: "Desert Combat Rifle", created_at: "2013-04-18 00:33:51", updated_at: "2013-04-18 00:33:51", active: true, price: 310000, photo_file_name: "lg_g36.jpg", photo_content_type: "image/jpeg", photo_file_size: 12767, photo_updated_at: "2013-04-18 00:33:51", slug: nil, store_id: 2, photo_url: nil},
                            {title: "MG4", description: "Fully automatic machine gun 7.62", created_at: "2013-04-18 00:35:39", updated_at: "2013-04-18 00:35:39", active: true, price: 420000, photo_file_name: "lg_mg4.jpg", photo_content_type: "image/jpeg", photo_file_size: 17543, photo_updated_at: "2013-04-18 00:35:39", slug: nil, store_id: 2, photo_url: nil},
                            {title: "M320", description: "Grenade Launcher", created_at: "2013-04-18 00:36:34", updated_at: "2013-04-18 00:36:34", active: true, price: 220000, photo_file_name: "lg_m320.jpg", photo_content_type: "image/jpeg", photo_file_size: 19464, photo_updated_at: "2013-04-18 00:36:34", slug: nil, store_id: 2, photo_url: nil},
                            {title: "GMG Mortar Launcher", description: "40mm Mortar Launcher", created_at: "2013-04-18 00:37:22", updated_at: "2013-04-18 00:37:22", active: true, price: 170000, photo_file_name: "lg_gmg.jpg", photo_content_type: "image/jpeg", photo_file_size: 23652, photo_updated_at: "2013-04-18 00:37:22", slug: nil, store_id: 2, photo_url: nil}]

