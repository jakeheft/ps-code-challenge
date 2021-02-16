class Category
	attr_reader :category, :total_places, :total_chairs
	
	def initialize(category)
		@category = category
		@total_places = StreetCafe.where(category: category).group(:category).count[category]
		@total_chairs = StreetCafe.where(category: category).sum(:num_chairs)
	end
end