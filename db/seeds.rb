require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = %w(beaute haute-couture atypique new-face)
ethnicity = %w(caucasian asian black american francais)
hair_color = ["Blond", "Brunnette", "Red Hair", "Auburn", "Black"]

gender = [:men, :women]

photos = [{
  public_id: "houbuztjdrds9cvdqbva",
  version: "1470936078",
  width: 532,
  height: 800,
  format: "jpg",
  resource_type: "image"},
  {
  public_id: "qo4fb58vxntmpehyw1nx",
  version: "1470845693",
  width: 1384,
  height: 1080,
  format: "jpg",
  resource_type: "image"},
    {
  public_id: "dj2gqn7ssrs7snlxnqks",
  version: "1470842816",
  width: 1280,
  height: 852,
  format: "jpg",
  resource_type: "image"},
   {
  public_id: "o6z9wdubc1n31fbjkbjy",
  version: "1470842779",
  width: 1280,
  height: 853,
  format: "jpg",
  resource_type: "image"},
     {
  public_id: "x6eqe1nmkh23mrdrinpp",
  version: "1470825768",
  width: 640,
  height: 640,
  format: "jpg",
  resource_type: "image"}


]

30.times do
mannequin = Mannequin.new(
    age: Faker::Number.number(2),
    category: category.sample,
    description: Faker::Hipster.paragraph,
    height: Faker::Number.number(2),
    chest: Faker::Number.number(2),
    waist: Faker::Number.number(2),
    hair_color: hair_color.sample,
    eyes: Faker::Color.color_name,
    ethnicity: ethnicity.sample,
    hips: Faker::Number.number(2),
    location: Faker::Address.city,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone:Faker::Number.number(10),
    gender: gender.sample,
  )

mannequin.photos.build(
  photos.sample
  )

mannequin.save

end









