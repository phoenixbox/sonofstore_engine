store1 = Store.create(name: "Xmen", path: "xmen", description: "all things xmen")
store2 = Store.create(name: "Avengers", path: "avengers", description: "all things avengers")
store3 = Store.create(name: "Justice League", path: "justice-league", description: "all things justice league")

user1 = User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
user2 = User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
user3 = User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

user4 = User.create(full_name: "Professor X", email: "admin@example.com", password: "password")
user5 = User.create(full_name: "Wolverine", email: "wolverine@example.com", password: "password", store_id: 4)
user6 = User.create(full_name: "Ironman", email: "ironmanw@example.com", password: "password", store_id: 5)
user7 = User.create(full_name: "Batman", email: "batman@example.com", password: "password", store_id: 6)
user8 = User.create(full_name: "Magneto", email: "magneto@example.com", password: "password")

user4.assign_super_admin


UserStoreRole.create({user_id: 5, store_id: 1, role: 'admin'}, as: :super_admin)
UserStoreRole.create({user_id: 6, store_id: 2, role: 'stocker'}, as: :super_admin)
UserStoreRole.create({user_id: 7, store_id: 3, role: 'admin'}, as: :super_admin)




