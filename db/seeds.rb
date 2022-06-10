# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Hotel.destroy_all
Reservation.destroy_all

@user1 = User.create!( email: 'test@example.com', password: '12345678', username: 'tester', role: 'admin')
@hotel1 = Hotel.create!( name: 'Hotel 1', description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras et lorem et metus finibus ornare. Nulla posuere egestas sapien at viverra. Maecenas consequat nisi sed faucibus pretium. Duis luctus risus sed turpis ultricies, non lobortis sem luctus. Fusce laoreet, tortor et suscipit semper, libero nunc ultricies lacus, sollicitudin vehicula lorem lectus nec elit. Nunc eu sapien porttitor, dapibus purus at, tincidunt metus. Proin molestie auctor elit in blandit. Donec sed finibus tortor", address: 'Address 1', city: 'City 1', country: 'Egypt', room_price: 20, pet_friendly: true, number_of_rooms: 11 , stars: 4, current_free_rooms: 1, image_url: 'https://cdn4.iconfinder.com/data/icons/hotel-vacation/33/hotel-3-512.png', user_id: @user1.id)
@reservation1 = Reservation.create!( check_in_date: '2020-06-01', check_out_date: '2020-06-02', room_number: 1, user_id: @user1.id, hotel_id: @hotel1.id)
