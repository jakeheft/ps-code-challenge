require 'csv'

class StreetCafesController < ApplicationController
	def destroy
		small_cafes = StreetCafe.find_by_sql("SELECT street_cafes.* FROM street_cafes WHERE (category iLIKE '%small%')")
		export_and_destroy(small_cafes)
		update
	end

	def update
		med_cafes = StreetCafe.find_by_sql("SELECT street_cafes.* FROM street_cafes WHERE (category iLIKE '%medium%')")
		large_cafes = StreetCafe.find_by_sql("SELECT street_cafes.* FROM street_cafes WHERE (category iLIKE '%large%')")
		med_large_cafes = med_cafes + large_cafes
		join_category_to_name(med_large_cafes)
	end
	
	def export_and_destroy(cafes)
		file = './db/data/small_cafes.csv'
		headers = ['id', 'name', 'address', 'post_code', 'num_chairs', 'note', 'created_at', 'updated_at', 'category']
		CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
			cafes.each do |cafe|
				writer << [cafe.id, cafe.name, cafe.address, cafe.post_code, cafe.num_chairs, cafe.note, cafe.created_at, cafe.updated_at, cafe.category]
				cafe.destroy
			end
		end
	end
	
	def join_category_to_name(cafes)
		cafes.each do |cafe|
			cafe.update(name: "#{cafe.category}-#{cafe.name}")
		end
	end
end