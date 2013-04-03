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
product6 = Product.create(title: "Professor Glasses",
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

cart1 = Cart.create
line_item1 = LineItem.create(product_id: 1, cart_id: cart1.id)
order1 = Order.create(total_price: line_item1.total_price, status: "shipped", user_id: 1)
order1.line_items = []
order1.line_items << line_item1

cart2 = Cart.create
line_item2 = LineItem.create(product_id: 2, cart_id: cart2.id)
line_item3 = LineItem.create(product_id: 3, cart_id: cart2.id, quantity: 3)
order2 = Order.create(total_price: (line_item2.total_price + line_item3.total_price), status: "paid", user_id: 1)
order2.line_items = []
order2.line_items << line_item2
order2.line_items << line_item3

cart3 = Cart.create
line_item4 = LineItem.create(product_id: 4, cart_id: cart3.id, quantity: 2)
line_item5 = LineItem.create(product_id: 5, cart_id: cart3.id, quantity: 4)
line_item6 = LineItem.create(product_id: 6, cart_id: cart3.id)
order3 = Order.create(total_price: (line_item4.total_price + line_item5.total_price + line_item6.total_price), status: "pending", user_id: 1)
order3.line_items = []
order3.line_items << line_item4
order3.line_items << line_item5
order3.line_items << line_item6

cart4 = Cart.create
line_item7 = LineItem.create(product_id: 7, cart_id: cart4.id, quantity: 2)
line_item8 = LineItem.create(product_id: 8, cart_id: cart4.id, quantity: 2)
line_item9 = LineItem.create(product_id: 9, cart_id: cart4.id, quantity: 2)
order4 = Order.create(total_price: (line_item7.total_price + line_item8.total_price + line_item9.total_price), status: "returned", user_id: 2)
order4.line_items = []
order4.line_items << line_item7
order4.line_items << line_item8
order4.line_items << line_item9

cart5 = Cart.create
line_item10 = LineItem.create(product_id: 10, cart_id: cart5.id)
line_item11 = LineItem.create(product_id: 11, cart_id: cart5.id)
order5 = Order.create(total_price: (line_item10.total_price + line_item11.total_price), status: "cancelled", user_id: 2)
order5.line_items = []
order5.line_items << line_item10
order5.line_items << line_item11

cart6 = Cart.create
line_item12 = LineItem.create(product_id: 12, cart_id: cart6.id)
line_item13 = LineItem.create(product_id: 13, cart_id: cart6.id)
order6 = Order.create(total_price: (line_item12.total_price + line_item13.total_price), status: "pending", user_id: 2)
order6.line_items = []
order6.line_items << line_item12
order6.line_items << line_item13

cart7 = Cart.create
line_item14 = LineItem.create(product_id: 14, cart_id: cart7.id)
line_item15 = LineItem.create(product_id: 15, cart_id: cart7.id)
line_item16 = LineItem.create(product_id: 16, cart_id: cart7.id)
order7 = Order.create(total_price: (line_item14.total_price + line_item15.total_price + line_item16.total_price), status: "paid", user_id: 3)
order7.line_items = []
order7.line_items << line_item14
order7.line_items << line_item15
order7.line_items << line_item16

cart8 = Cart.create
line_item17 = LineItem.create(product_id: 17, cart_id: cart8.id)
line_item18 = LineItem.create(product_id: 18, cart_id: cart8.id)
order8 = Order.create(total_price: (line_item17.total_price + line_item18.total_price), status: "shipped", user_id: 3)
order8.line_items = []
order8.line_items << line_item17
order8.line_items << line_item18

cart9 = Cart.create
line_item19 = LineItem.create(product_id: 19, cart_id: cart9.id)
line_item20 = LineItem.create(product_id: 20, cart_id: cart9.id)
line_item21 = LineItem.create(product_id: 1, cart_id: cart9.id)
order9 = Order.create(total_price: (line_item19.total_price + line_item20.total_price + line_item21.total_price), status: "returned", user_id: 3)
order9.line_items = []
order9.line_items << line_item19
order9.line_items << line_item20
order9.line_items << line_item21

cart10 = Cart.create
line_item22 = LineItem.create(product_id: 2, cart_id: cart10.id, quantity: 2)
line_item23 = LineItem.create(product_id: 3, cart_id: cart10.id)
line_item24 = LineItem.create(product_id: 4, cart_id: cart10.id, quantity: 3)
line_item25 = LineItem.create(product_id: 5, cart_id: cart10.id)
line_item26 = LineItem.create(product_id: 6, cart_id: cart10.id, quantity: 5)
line_item27 = LineItem.create(product_id: 7, cart_id: cart10.id)
order10 = Order.create(total_price: (line_item22.total_price + line_item23.total_price + line_item24.total_price + line_item25.total_price + line_item26.total_price + line_item27.total_price), status: "cancelled", user_id: 3)
order10.line_items = []
order10.line_items << line_item22
order10.line_items << line_item23
order10.line_items << line_item24
order10.line_items << line_item25
order10.line_items << line_item26
order10.line_items << line_item27

category1 = Category.create(name: "hats")
category2 = Category.create(name: "wigs")
category3 = Category.create(name: "glasses")
category4 = Category.create(name: "mustaches")
category5 = Category.create(name: "mouths (teeth and lips)")
category6 = Category.create(name: "hair")
category7 = Category.create(name: "sideburns")
category8 = Category.create(name: "beards")
category9 = Category.create(name: "facial hair")

User.create(full_name: "Wolverine", email: "w@example.com", password: "password")

User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

admin = User.create(full_name: "Tony Stark", email: "admin@example.com", password: "password")
admin.admin = true

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
