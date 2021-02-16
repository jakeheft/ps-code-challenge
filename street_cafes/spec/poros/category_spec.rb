require 'rails_helper'

describe Category do
	it 'exists' do
		post_code = 'LS1 5EL'
		category_data = 'ls1 small'
		cafe1 = create(:street_cafe, post_code: post_code, num_chairs: 5, category: category_data)
		cafe2 = create(:street_cafe, post_code: post_code, num_chairs: 8, category: category_data)

		category = Category.new(category_data)

		expect(category).to be_a(Category)
		expect(category.category).to eq(category_data)
		expect(category.total_places).to eq(2)
		expect(category.total_chairs).to eq(13)
	end
end