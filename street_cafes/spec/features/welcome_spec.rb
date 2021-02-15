require 'rails_helper'

describe 'Welcome Page' do
	it 'has a button that will categorize cafes' do
		post_code1 = 'LS1 5EL'
		post_code2 = 'LS2 3AD'
		post_code3 = 'LS10 9CO'
		cafe1 = create(:street_cafe, post_code: post_code1, num_chairs: 20)
		cafe2 = create(:street_cafe, post_code: post_code1, num_chairs: 5)
		cafe3 = create(:street_cafe, post_code: post_code1, num_chairs: 101)
		cafe4 = create(:street_cafe, post_code: post_code1, num_chairs: 100)
		cafe5 = create(:street_cafe, post_code: post_code2, num_chairs: 200)
		cafe6 = create(:street_cafe, post_code: post_code2, num_chairs: 20)
		cafe7 = create(:street_cafe, post_code: post_code2, num_chairs: 32)
		cafe8 = create(:street_cafe, post_code: post_code3, num_chairs: 32)

		expect(cafe1.category).to eq(nil)
		expect(cafe2.category).to eq(nil)
		expect(cafe3.category).to eq(nil)
		expect(cafe4.category).to eq(nil)
		expect(cafe5.category).to eq(nil)
		expect(cafe6.category).to eq(nil)
		expect(cafe7.category).to eq(nil)
		expect(cafe8.category).to eq(nil)

		visit root_path

		click_button 'Categorize Cafes'

		expect(current_path).to eq('/categories')
	end
end