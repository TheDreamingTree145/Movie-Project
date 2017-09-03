# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genres = ["Action", "Comedy", "Drama", "Documentary", "Horror", "Indie", "Sci-Fi", "Suspense", "Thriller"]

Genres.each do |genre_name|
  Genre.create(title: genre_name)
end

10.times do
  @user = User.new(email: Faker::Internet.email, password: Faker::Internet.password)
  @user.movies.build(title: Faker::Book.title, release_date: rand(1920..2018), critic_rating: rand(0..100), awards: rand(0..20), genre_id: Genre.all.ids.sample, created_by: @user.email)
  @user.save
end

gender_choice = ["Male", "Female"]

30.times do
  actor = Actor.new(name: Faker::Name.name, gender: gender_choice.sample, age: rand(1..100))
  actor.save
end

Movie.all.each do |movie|
  character = movie.characters.build(name: Faker::Name.first_name, movie_id: movie.id, actor_id: Actor.all.ids.sample, quote: Faker::Movie.quote)
  character_2 = movie.characters.build(name: Faker::Name.first_name, movie_id: movie.id, actor_id: Actor.all.ids.sample, quote: Faker::Movie.quote)
  character_3 = movie.characters.build(name: Faker::Name.first_name, movie_id: movie.id, actor_id: Actor.all.ids.sample, quote: Faker::Movie.quote)
  character.save
  character_2.save
  character_3.save
end
