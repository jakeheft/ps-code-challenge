require 'rails_helper'

describe 'Post Code Index' do
	it 'can display data' do
		post_code1 = 'LS1 5EL'
		post_code2 = 'LS1 3AD'
		cafe1 = create(:street_cafe, post_code: post_code1, num_chairs: 20)
		cafe2 = create(:street_cafe, post_code: post_code1, num_chairs: 5)
		cafe3 = create(:street_cafe, post_code: post_code1, num_chairs: 100)
		cafe4 = create(:street_cafe, post_code: post_code1, num_chairs: 50)
		cafe5 = create(:street_cafe, post_code: post_code2, num_chairs: 200)
		cafe6 = create(:street_cafe, post_code: post_code2, num_chairs: 20)
		cafe7 = create(:street_cafe, post_code: post_code2, num_chairs: 32)

		visit post_code_data_path

		expect(page).to have_content('post_code')
		expect(page).to have_content('total_places')
		expect(page).to have_content('total_chairs')
		expect(page).to have_content('chairs_pct')
		expect(page).to have_content('place_with_max_chairs')
		
		within("##{post_code1}") do
			
		end

		within("##{post_code2}") do
			
		end
	end
end