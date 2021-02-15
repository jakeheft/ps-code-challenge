class PostCode
	attr_reader :code, :total_places, :total_chairs
	def initialize(code)
		@code = code
		@total_places = StreetCafe.where(post_code: code).group(:post_code).count[code]
		@total_chairs = StreetCafe.where(post_code: code).sum(:num_chairs)
	end
end