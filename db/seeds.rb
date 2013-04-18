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

# store_moda_peligrosa = Store.create(name: "Moda Peligrosa", path: 'moda_peligrosa', description: "Dangerous fashion")
# store_moda_peligrosa.status = 'online'
# store_moda_peligrosa.save

store3 = Store.create(name: "Star Handbags", path: "star_handbags", description: 'Ladies Handbags')
store4 = Store.create(name: "Mountain Man Boots", path: "mountain_man_boots", description: "Boots for Real Men")
store5 = Store.create(name: "Suited Up", path: "suited_up", description: "Mens Suits")
store6 = Store.create(name: "NeverLost", path: "never_lost", description: "GPS units")
store7 = Store.create(name: "Moto-Anarchy", path: "sons_of_anarchy", description: "Motorcyle Gear")
store8 = Store.create(name: "Swords R Us", path: "swords_r_us", description: 'Swords and stuff')
store9 = Store.create(name: "Carve", path: "carve", :description => "Snowboards for shredders")
store10 = Store.create(name: "Lady Tri", path: "lady_tri", description: "Triathalon Gear for Her")

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

# UserStoreRole.create({user_id: user_tactical_assets.id, store_id: store_tactical_assets.id, role: 'admin'})
# UserStoreRole.create({user_id: stocker_tactical_assets.id, store_id: store_tactical_assets.id, role: 'stocker'})

# user_moda_peligrosa = User.create(full_name: 'Neha Shah', email: "neha@modapeligrosa.es", password: 'password',
#                                   password_confirmation: 'password', display_name: 'Neha')
# stocker_moda_peligrosa = User.create(full_name: 'Javier Sanchez', email: "javier@modapeligrosa.es", password: 'password',
#                                   password_confirmation: 'password', display_name: 'Javier')

# UserStoreRole.create({user_id: user_moda_peligrosa.id, store_id: store_moda_peligrosa.id, role: 'admin'})
# UserStoreRole.create({user_id: stocker_moda_peligrosa.id, store_id: stocker_moda_peligrosa.id, role: 'stocker'})





user1 = User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
user2 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
user3 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

user4 = User.create(full_name: "Professor X", email: "admin@example.com", password: "password")
 HEAD
user5 = User.create(full_name: "Wolverine", email: "wolverine@example.com", password: "password")
user6 = User.create(full_name: "Ironman", email: "ironmanw@example.com", password: "password")
user7 = User.create(full_name: "Batman", email: "batman@example.com", password: "password")
user8 = User.create(full_name: "Magneto", email: "magneto@example.com", password: "password")

user4.assign_super_admin
user4.super_admin = true
user4.save

user5 = User.create(full_name: "Wolverine", email: "wolverine@example.com", password: "password")

user6 = User.create(full_name: "Ironman", email: "ironmanw@example.com", password: "password")

user7 = User.create(full_name: "Batman", email: "batman@example.com", password: "password")

UserStoreRole.create({user_id: 5, store_id: 1, role: 'admin'})
UserStoreRole.create({user_id: 6, store_id: 2, role: 'stocker'})
UserStoreRole.create({user_id: 7, store_id: 3, role: 'admin'})



rue_copine_products = [{title: "Robe", description: "Tres beau robe.", created_at: "2013-04-17 20:32:26", updated_at: "2013-04-17 20:32:26", active: true, price: 23700, slug: nil, store_id: store_rue_copine.id, photo_url: 'http://placehold.it/200x300'}]
1000.times.each do |i|
  rue_copine_products.each do |p|
    product = Product.new(p)
    product.title = "#{product.title}#{i}#{rand(1..1000000)}"
    product.save
  end
end

tactical_assets_products = [{title: "MP7-A1", description: "Assault Rifle", created_at: "2013-04-18 00:21:09", updated_at: "2013-04-18 00:21:09", active: true, price: 200000, slug: nil, store_id: 2, photo_url: 'http://placehold.it/200x300'}]
1000.times.each do |i|
  tactical_assets_products.each do |p|
    product = Product.new(p)
    product.title = "#{product.title} #{i}#{rand(1..1000000)}"
    product.save
  end
end

10_000.times do |i|
  User.create(full_name: "Name"+"#{i}", email: "faker@"+"#{rand(1..100000000)}", password: "password")
end
[store3,store4,store5,store6,store7,store8,store9,store10].each do |s|
  10_001.times do |int|
  
    Product.create(title: "#{Faker::Lorem.words(2).join.to_s}"+"#{rand(1..10000000000)}"+"#{rand(1..100000000000)}",
                    description: "#{Faker::Lorem.words(3).join.to_s}",
                    price_in_dollars: rand(1..int),
                    store_id: s.id, :photo_url => 'http://placehold.it/200x300')
  end

  10.times do |i|
    Category.create(:name => "category"+"#{s.id}"+"#{rand(1..100000000)}", :store_id => s.id)
  end

  10.times do |i|
    ProductCategory.create(product_id: (Store.find_by_id(s.id).products.first.id), category_id: i)
  end
end
