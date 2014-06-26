# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Dress.all.each do |d|
  brand = Brand.find_by(name: d.brand)
  Brand.create!(name: d.brand) if brand.nil?
end

Length.create!(name: "Mini")
Length.create!(name: "Midi")
Length.create!(name: "Maxi")

Color.create!(name: "Black")
Color.create!(name: "White")
Color.create!(name: "Red")
Color.create!(name: "Green")
Color.create!(name: "Yellow")
Color.create!(name: "Blue")
Color.create!(name: "Orange")
Color.create!(name: "Purple")

DressType.create!(name: "Formal")
DressType.create!(name: "Evening")
DressType.create!(name: "Party")

colors = ["Black", "White", "Red", "Green", "Yellow", "Blue", "Orange", "Purple"]
times = [0,1,2]
types = ["Formal", "Evening", "Party"]

Dress.all.each do |d|
  if true
    d.update(brand: Brand.all[0..-2].sample.name) 
    d.update(length: Length.all.sample.name) 
    times.sample.times do
      d.colors.create(name: colors.sample)
    end
    times.sample.times do
      d.dress_types.create(name: types.sample)
    end
  end
end