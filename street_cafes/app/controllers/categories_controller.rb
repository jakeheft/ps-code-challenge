class CategoriesController < ApplicationController
	def index
		categories = StreetCafe.distinct.pluck(:category)
		@categories = categories.map { |category| Category.new(category) }
	end

	def create
		StreetCafe.all.each do |cafe|
			categorize(cafe)
		end
		redirect_to categories_path
	end
	
	def categorize(cafe)
		sort_code = cafe.post_code.split(' ').first
		if sort_code == 'LS1'
			if cafe.num_chairs < 10
				cafe.update(category: 'ls1 small')
			elsif cafe.num_chairs < 100
				cafe.update(category: 'ls1 medium')
			else
				cafe.update(category: 'ls1 large')
			end
		elsif sort_code == 'LS2'
			chair_cutoff = fiftieth_percentile
			if cafe.num_chairs > chair_cutoff
				cafe.update(category: 'ls2 large')
			else
				cafe.update(category: 'ls2 small')
			end
		else
			cafe.update(category: 'other')
		end
	end

	def fiftieth_percentile
		@fiftieth_percentile ||= begin
			ordered_cafes = StreetCafe.where('post_code iLIKE ?', "%LS2 %")
			ordered_cafes[ordered_cafes.length / 2].num_chairs
		end
	end
end