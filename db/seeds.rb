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


3.times do
mannequin = Mannequin.new(
    age: Faker::Number.number(2),
    category: category.sample,
    description: Faker::Hipster.paragraph,
    height: Faker::Number.number(2),
    chest: Faker::Number.number(2),
    waist: Faker::Number.number(2),
    hair_color: Faker::Color.color_name,
    eyes: Faker::Color.color_name,
    ethnicity: ethnicity.sample,
    hips: Faker::Number.number(2),
    location: Faker::Address.city,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone:Faker::Number.number(10),
  )

mannequin.photos.build(
  public_id: "zcfijxxqikiskuapqzjz",
  version: "1470843624",
  width: 1280,
  height: 936,
  format: "jpg",
  resource_type: "image",
  )

mannequin.save

end









