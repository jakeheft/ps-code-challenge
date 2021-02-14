# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

StreetCafe.destroy_all

CSV.foreach(Rails.root.join('db/data/street_cafes_2020-21.csv'), headers: ['name', 'address', 'post_code', 'num_chairs', 'note']) do |row|
	StreetCafe.create(row.to_h)
end

StreetCafe.first.destroy