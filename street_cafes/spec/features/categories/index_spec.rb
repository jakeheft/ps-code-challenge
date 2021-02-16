require 'rails_helper'

describe 'Categories Index' do
	it 'can display category data' do
		post_code1 = 'LS1 5EL'
		post_code2 = 'LS2 3AD'
		post_code3 = 'LS10 9CO'
		post_code4 = 'LS9 7IA'
		cafe1 = create(:street_cafe, post_code: post_code1, num_chairs: 20)
		cafe2 = create(:street_cafe, post_code: post_code1, num_chairs: 5)
		cafe3 = create(:street_cafe, post_code: post_code1, num_chairs: 101)
		cafe4 = create(:street_cafe, post_code: post_code1, num_chairs: 100)
		cafe5 = create(:street_cafe, post_code: post_code2, num_chairs: 50)
		cafe6 = create(:street_cafe, post_code: post_code2, num_chairs: 45)
		cafe7 = create(:street_cafe, post_code: post_code2, num_chairs: 44)
		cafe8 = create(:street_cafe, post_code: post_code2, num_chairs: 43)
		cafe9 = create(:street_cafe, post_code: post_code2, num_chairs: 42)
		cafe10 = create(:street_cafe, post_code: post_code3, num_chairs: 32)
		cafe10 = create(:street_cafe, post_code: post_code4, num_chairs: 34)

		visit root_path

		click_button 'Categorize Cafes'

		expect(page).to have_content('category')
		expect(page).to have_content('total_places')
		expect(page).to have_content('total_chairs')

		within "#ls1small" do
			expect(page).to have_content('ls1 small')
			expect(page).to have_content(1)
			expect(page).to have_content(5)
		end

		within "#ls1medium" do
			expect(page).to have_content('ls1 medium')
			expect(page).to have_content(1)
			expect(page).to have_content(20)
		end

		within "#ls1large" do
			expect(page).to have_content('ls1 large')
			expect(page).to have_content(2)
			expect(page).to have_content(201)
		end

		within "#ls2small" do
			expect(page).to have_content('ls2 small')
			expect(page).to have_content(3)
			expect(page).to have_content(129)
		end

		within "#ls2large" do
			expect(page).to have_content('ls2 large')
			expect(page).to have_content(2)
			expect(page).to have_content(95)
		end

		within "#other" do
			expect(page).to have_content('other')
			expect(page).to have_content(2)
			expect(page).to have_content(66)
		end
	end
end