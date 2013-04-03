product1 = Product.create(title: "Pencil-Thin Mustache",
               description: "Adhesive, mystery-solving facial hair that is sure to fool anyone and everyone.",
               price_in_dollars: 10.00)
product2 =Product.create(title: "Grandma's Glasses",
               description: "Do you want to break up the gang of Tea Shop bandits? Look 84 in these beauaties.",
               price_in_dollars: 35.00)
product3 = Product.create(title: "Jolly Gold Frames",
               description: "Trying to take down malevolent elves in Santa's workshop? Try our Oval-Shaped Gold Frames.",
               price_in_dollars: 25.00)
product4 = Product.create(title: "These Glasses Are Over",
               description: "Hipster or librarian? You decide.",
               price_in_dollars: 39.00)
product5 = Product.create(title: "Wire Aviator Glasses",
               description: "Flying over the high seas with John Travolta? Look the part with our Wire Aviator Glasses.",
               price_in_dollars: 21.00)
product6 = Product.create(title: "European Professor Glasses",
               description: "Do you want to carry around books and look really important? Then these glasses are for you!",
               price_in_dollars: 30.00)
product7 = Product.create(title: "Bruno Bowler",
               description: "Looking to infiltrate an unruly band of steam punks? The Bruno Bowler will help you fit right in.",
               price_in_dollars: 70.00)
product8 = Product.create(title: "Lincoln Top Hat",
               description: "Are you trying to take down civil war re-enactors? Maybe there is mayhem at the local dinner theater performing 'A Christmas Carol'. Either way, this top hat will camouflage you any day.",
               price_in_dollars: 100.00)
product9 = Product.create(title: "Mobster Hat",
               description: "Those pesky mobsters at Carmine's Dry Cleaning will never see you coming!",
               price_in_dollars: 115.00)
product10 = Product.create(title: "Weatherman Teeth",
               description: "For those solving the 'Case of the Missing Hairspray' at the local news station.",
               price_in_dollars: 75.00)
product11 = Product.create(title: "Candy's Lips",
               description: "Trying to catch a ring of drag queen thieves? These lips and a feather boa will get you into their inner circle!",
               price_in_dollars: 5.00)
product12 = Product.create(title: "Argo Beard",
               description: "Lumberjack Serial Killers on the loose? No problem for this extra adhesive beard. It has been tested to stay on in the most strenuous of circumstances, even scaling a 100 ft. tree!",
               price_in_dollars: 50.00)
product13 = Product.create(title: "Musketeer Beard",
               description: "Is someone stealing deep-fried Snickers bars from the blacksmith at the Renaissance Festival? Prepare to pack a sword and fight for vengeance with this facial frock.",
               price_in_dollars: 45.00)
product14 = Product.create(title: "Homeless Harold Beard",
               description: "Need to get in with the shopping cart gang? Collect trash and eat it in this realistically ratty get-up!",
               price_in_dollars: 70.00)
product15 = Product.create(title: "Cowboy Stache",
               description: "Those pesky cow tippers are at it again! Brandish your branding iron and scare them away in this classy stache.",
               price_in_dollars: 40.00)
product16 = Product.create(title: "Bro-Chad Hair",
               description: "Someone has been stealing Lacoste polo shirts from the mall with just a double popped collar and this wig you will fit right in and find the thief!",
               price_in_dollars: 45.00)
product17 = Product.create(title: "Curly Top Fro",
               description: "Fire in the disco? Other afro wigs are over-sized and hard to manage! Keep it cool and natural with the Curly Top!",
               price_in_dollars: 30.00)
product18 = Product.create(title: "Surfer Hair",
               description: "Trying to capture the lifeguard that takes pleasure in peeing in the pool? Get yourself a whistle and beware of adult swim!",
               price_in_dollars: 65.00)
product19 = Product.create(title: "Metal Beard",
               description: "The case of the slayer from the Slayer concert will be solved easily with this handy, devilish beard!",
               price_in_dollars: 45)
product20 = Product.create(title: "Stoner Sideburns",
               description: "Tie Dye Thievery is an intense offense! Spark up a doobie and glue these on your face. No one will see your trickery! Not that they would notice anyway...",
               price_in_dollars: 18.00)

# Order.create() #need 10
category1 = Category.create(name: "hats")
category2 = Category.create(name: "wigs")
category3 = Category.create(name: "glasses")
category4 = Category.create(name: "mustaches")
category5 = Category.create(name: "mouths (teeth and lips)")
category6 = Category.create(name: "hair")
category7 = Category.create(name: "sideburns")
category8 = Category.create(name: "beards")
category9 = Category.create(name: "facial hair")
User.create(full_name: "Tony Stark", email: "admin@example.com", password: "admin", admin: true)
User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

ProductCategory.create(product_id: (product1.id), category_id: (category4.id))
ProductCategory.create(product_id: (product1.id), category_id: (category6.id))
ProductCategory.create(product_id: (product1.id), category_id: (category8.id))
ProductCategory.create(product_id: (product2.id), category_id: (category3.id))
ProductCategory.create(product_id: (product3.id), category_id: (category3.id))
ProductCategory.create(product_id: (product4.id), category_id: (category3.id))
ProductCategory.create(product_id: (product5.id), category_id: (category3.id))
ProductCategory.create(product_id: (product6.id), category_id: (category3.id))
ProductCategory.create(product_id: (product7.id), category_id: (category1.id))
ProductCategory.create(product_id: (product8.id), category_id: (category1.id))
ProductCategory.create(product_id: (product9.id), category_id: (category1.id))
ProductCategory.create(product_id: (product10.id), category_id: (category5.id))
ProductCategory.create(product_id: (product11.id), category_id: (category5.id))
ProductCategory.create(product_id: (product12.id), category_id: (category8.id))
ProductCategory.create(product_id: (product12.id), category_id: (category9.id))
ProductCategory.create(product_id: (product12.id), category_id: (category6.id))
ProductCategory.create(product_id: (product13.id), category_id: (category8.id))
ProductCategory.create(product_id: (product13.id), category_id: (category9.id))
ProductCategory.create(product_id: (product13.id), category_id: (category6.id))
ProductCategory.create(product_id: (product14.id), category_id: (category8.id))
ProductCategory.create(product_id: (product14.id), category_id: (category9.id))
ProductCategory.create(product_id: (product14.id), category_id: (category6.id))
ProductCategory.create(product_id: (product15.id), category_id: (category4.id))
ProductCategory.create(product_id: (product15.id), category_id: (category9.id))
ProductCategory.create(product_id: (product15.id), category_id: (category6.id))
ProductCategory.create(product_id: (product16.id), category_id: (category2.id))
ProductCategory.create(product_id: (product16.id), category_id: (category6.id))
ProductCategory.create(product_id: (product17.id), category_id: (category2.id))
ProductCategory.create(product_id: (product17.id), category_id: (category6.id))
ProductCategory.create(product_id: (product18.id), category_id: (category2.id))
ProductCategory.create(product_id: (product18.id), category_id: (category6.id))
ProductCategory.create(product_id: (product19.id), category_id: (category8.id))
ProductCategory.create(product_id: (product19.id), category_id: (category9.id))
ProductCategory.create(product_id: (product19.id), category_id: (category6.id))
ProductCategory.create(product_id: (product20.id), category_id: (category7.id))
ProductCategory.create(product_id: (product20.id), category_id: (category9.id))
ProductCategory.create(product_id: (product20.id), category_id: (category6.id))

