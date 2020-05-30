puts "Destroying all Products"
CustomerProduct.destroy_all
Product.destroy_all

puts "Destroying all customers"

Customer.destroy_all


puts "Destroying all folders"

Folder.destroy_all


puts "Destroying users"

User.destroy_all

#--------------------------

puts "Creating users"

user1 = User.new(
  email: "user1@user.com",
  password: "password"
  )

user1.save

user2 = User.new(
  email: "user2@user.com",
  password: "password"
  )

user2.save

puts "2 users created"

#---------------

puts "Creating some products"

product1 = Product.new(name: "RT8 270cc")
product1.save

product2 = Product.new(name: "2Drive")
product2.save

puts "Created 2 products"

#---------------

puts "Creating some folders"

folder1 = Folder.new(
  name: "Current Customers")

folder1.save

folder2 = Folder.new(
  name: "Competitors")

folder2.save

#------------------------------




puts "Creating customers"

cust1 = Customer.new(
  company_name: "Phillip Island Go Kart",
  contact_name: "Andrew B",
  email: "andrew@pio.com.au",
  contact_number: "0456789100",
  website: "https://www.phillipislandcircuit.com.au/",
  address:  "Ventnor VIC 3922",
  notes: "The 750m Phillip Island Go Kart track is a replica of the world-renowned Phillip Island Grand Prix Circuit situated alongside the circuit and overlooking Bass Strait.",
  user_id: user1.id,
  folder_id: folder1.id
  )


cust1.save

cust2 = Customer.new(
  company_name: "Ace Kart",
  contact_name: "Ali, Paul and Russ",
  user_id: user1.id,
  folder_id: folder2.id
  )

cust2.save

puts "Created 2 customers"

#----------------------

puts "Creating some Customer Products"

cust_product1 = CustomerProduct.new(
  product_id: product1.id,
  customer_id: cust1.id,
  quantity: 30)

cust_product1.save

cust_product2 = CustomerProduct.new(
  product_id: product2.id,
  customer_id: cust1.id,
  quantity: 10)

cust_product2.save

cust_product3 = CustomerProduct.new(
  product_id: product1.id,
  customer_id: cust2.id,
  quantity: 27)

cust_product3.save


puts "Created 3 customer products"
