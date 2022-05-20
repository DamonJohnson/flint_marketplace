# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)


Item.destroy_all
User.destroy_all
Category.destroy_all
Profile.destroy_all

# mike = User.create(email: 'mike@email.com', password: 'password')
# mike.profile = Profile.create(first_name: 'Mike', last_name: 'Myers', address: '123 Foo Street', city: 'Sydney', postcode: 2000, state: 'New South Wales')
# mike.save

# christine = User.create(email: 'christine@email.com', password: 'password')
# christine.profile = Profile.create(first_name: 'Christine', last_name: 'Jones', address: '98 Chickiba Drive', city: 'Ballina', postcode: 2478, state: 'New South Wales')
# christine.save

# # fiona = User.create(email: 'fiona@email.com', password: 'password')
# # randal= User.create(email: 'randal@email.com', password: 'password')
# # greg = User.create(email: 'greg@email.com', password: 'password')
# # tom = User.create(email: 'tom@email.com', password: 'password')

# # profile = User.first.profiles.create(first_name: 'Tom', last_name: 'Sawyer', address: '123 Fake Street', city: 'Sydney', postcode: 2000, state: 'New South Wales')

# # Profile.create(user_id: User.first.id, first_name: 'christine', last_name: 'jones', address: "98 Chickiba Drive", city: 'East Ballina', postcode: 2478, state: 'New South Wales')
# # Profile.create(user_id: User.second.id, first_name: 'fiona', last_name: 'bakhteyari', address: "67 Baroona Road", city: 'Milton', postcode: 4067, state: 'Queensland')
# # Profile.create(user_id: User.third.id, first_name: 'randal', last_name: 'johnson', address: "123 Foo Street", city: 'Brisbane', postcode: 4000, state: 'Queensland')
# # Profile.create(user_id: User.last.id, first_name: 'greg', last_name: 'simpson', address: "4 Collins Street", city: 'Docklands', postcode: 3005, state: 'Victoria')

# categories = Category.create([{name: "4WD"},{name: "Campervan"},{name: "Caravan"},{name: "Boat"},{name: "Kayak / Canoe"},{name: "Bike"},{name: "Camping Equipment"},{name: "Surf"},{name: "Snow"},{name: 'Other'}])

