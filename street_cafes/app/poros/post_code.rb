class PostCode
	attr_reader :code, :total_places, :total_chairs
	def initialize(code)
		@code = code
		@total_places = StreetCafe.where(post_code: code).group(:post_code).count[code]
		@total_chairs = StreetCafe.where(post_code: code).sum(:num_chairs)
	end

	def chairs_pct
		(total_chairs.to_f / StreetCafe.sum(:num_chairs)) * 100
	end

	def place_with_max_chairs
		StreetCafe.find_by_sql("SELECT street_cafes.* FROM street_cafes WHERE street_cafes.post_code = '#{code}' ORDER BY street_cafes.num_chairs DESC LIMIT 1").first.name
	end
end