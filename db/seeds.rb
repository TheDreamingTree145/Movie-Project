# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password)
end

@user = User.create(email: "dustin@mail.com", password: "password")
@user_2 = User.last


5.times do
  @user.movies.create(title: Faker::Book.title, release_date: rand(1920..2018), critic_rating: rand(0..100), awards: rand(0..20))
  @user_2.movies.create(title: Faker::Book.title, release_date: rand(1920..2018), critic_rating: rand(0..100), awards: rand(0..20))
end

@movie = Movie.first
@movie_2 = Movie.last


gender_choice = ["Male", "Female"]

10.times do
  Actor.create(name: Faker::Name.name, gender: gender_choice.sample)
end

3.times do
  @character = @movie.characters.create(name: Faker::Name.first_name, actor_id: Actor.all.sample.id)
  @character_2 = @movie_2.characters.create(name: Faker::Name.first_name, actor_id: Actor.all.sample.id)
  @character.save
  @character_2.save
end
