Product.create(title: "Pencil-Thin Mustache",
               description: "Adhesive, mystery-solving facial hair that is sure to fool anyone and everyone.",
               price: 10.00)
Product.create(title: "Grandma's Glasses",
               description: "Do you want to break up the gang of Tea Shop bandits? Look 84 in these beauties.",
               price: 35.00)
Product.create(title: "Jolly Gold Frames",
               description: "Trying to take down malevolent elves in Santa’s workshop? Try our Oval-Shaped Gold Frames.",
               price: 25.00)
Product.create(title: "These Glasses Are Over",
               description: "Hipster or librarian? You decide.",
               price: 39.00)
Product.create(title: "Wire Aviator Glasses",
               description: "Flying over the high seas with John Travolta? Look the part with our Wire Aviator Glasses.",
               price: 21.00)

Order.create() #need 10
Category.create(name: "hats")
Category.create(name: "wigs")
Category.create(name: "glasses")
Category.create(name: "mustaches")
Category.create(name: "mouths (teeth and lips)")
Category.create(name: "hair")
Category.create(name: "sideburns")
Category.create(name: "beards")
Category.create(name: "facial hair")
User.create(first_name: "Franklin", last_name: "Webber", email: "demoXX+franklin@jumpstartlab.com",
            password: "password", password_confirmation: "password")
User.create(first_name: "Jeff", last_name: "", email: "demoXX+jeff@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "j3")
User.create(first_name: "Steve", last_name: "Klabnik", email: "demoXX+steve@jumpstartlab.com",
            password: "password", password_confirmation: "password", display_name: "SkrilleX")

