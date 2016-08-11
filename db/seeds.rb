require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = %w(beaute haute-couture atypique new-face)
ethnicity = %w(caucasian asian black american francais)

40.times do
mannequin = Mannequin.new (
    age: Faker::Number.decimal(2),
    address: Faker::Address.city,
    category: category.sample,
    description: Faker::Hipster.paragraph,
    height: Faker::Number.decimal(2),
    chest: Faker::Number.decimal(2),
    waist: Faker::Number.decimal(2),
    hair_color: Faker::Color.color_name,
    eyes: Faker::Color.color_name,
    ethnicity: ethnicity.sample,
    hips: Faker::Number.decimal(2),
    location: Faker::Address.city,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone:Faker::Number.decimal(10),
  )
mannequin.save
end

Faker::Placeholdit.image








