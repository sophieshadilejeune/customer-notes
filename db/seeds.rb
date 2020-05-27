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
  name: "Melbourne International EV Karting Complex",
  contact_number: "0404 600 716",
  address:  "Port Melbourne VIC 3207",
  notes: "The Go Kart Club of Victoria is located in Port Melbourne right next to the West Gate Bridge and over looks the City of Melbourne. We hold some of the largest race meetings in the country including rounds of the Australian Kart Championship and Rotax Pro Tour as well as our popular annual City of Melbourne Titles and our Monthly Club Days.",
  user_id: user1.id,
  folder_id: folder1.id
  )


cust1.save

cust2 = Customer.new(
  name: "234 Fun Galore - Go Karts, Lasertag & More",
  contact_number: "(03) 9317 8222",
  address:  " 234 Ballarat Rd, Braybrook VIC 3019",
  notes: "The Most Family Fun under One Roof in Melbourne
Go Kart Racing, Laser tag, Birthday Parties and More at Melbourne’s Largest Indoor Family Entertainment Centre",
  user_id: user1.id,
  folder_id: folder2.id

  )

cust2.save

puts "Created 2 customers"
