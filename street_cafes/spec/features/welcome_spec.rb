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
		cafe5 = create(:street_cafe, post_code: post_code2, num_chairs: 50)
		cafe6 = create(:street_cafe, post_code: post_code2, num_chairs: 45)
		cafe7 = create(:street_cafe, post_code: post_code2, num_chairs: 44)
		cafe8 = create(:street_cafe, post_code: post_code2, num_chairs: 43)
		cafe9 = create(:street_cafe, post_code: post_code2, num_chairs: 42)
		cafe10 = create(:street_cafe, post_code: post_code3, num_chairs: 32)

		expect(cafe1.category).to eq(nil)
		expect(cafe2.category).to eq(nil)
		expect(cafe3.category).to eq(nil)
		expect(cafe4.category).to eq(nil)
		expect(cafe5.category).to eq(nil)
		expect(cafe6.category).to eq(nil)
		expect(cafe7.category).to eq(nil)
		expect(cafe8.category).to eq(nil)
		expect(cafe9.category).to eq(nil)
		expect(cafe10.category).to eq(nil)

		visit root_path

		click_button 'Categorize Cafes'

		cafe1.reload
		cafe2.reload
		cafe3.reload
		cafe4.reload
		cafe5.reload
		cafe6.reload
		cafe7.reload
		cafe8.reload
		cafe9.reload
		cafe10.reload

		expect(current_path).to eq('/categories')
		expect(cafe1.category).to eq('ls1 medium')
		expect(cafe2.category).to eq('ls1 small')
		expect(cafe3.category).to eq('ls1 large')
		expect(cafe4.category).to eq('ls1 large')
		expect(cafe5.category).to eq('ls2 large')
		expect(cafe6.category).to eq('ls2 large')
		expect(cafe7.category).to eq('ls2 small')
		expect(cafe8.category).to eq('ls2 small')
		expect(cafe9.category).to eq('ls2 small')
		expect(cafe10.category).to eq('other')
	end

	it 'has a button that exports small cafe data, destroy records, patches med/large' do
		post_code1 = 'LS1 5EL'
		post_code2 = 'LS2 3AD'
		post_code3 = 'LS10 9CO'
		cafe1 = create(:street_cafe, name: 'Cool Cafe', post_code: post_code1, num_chairs: 20, category: 'ls1 medium')
		cafe2 = create(:street_cafe, name: 'Hip Spot', post_code: post_code1, num_chairs: 5, category: 'ls1 small')
		cafe3 = create(:street_cafe, name: 'Scary Place', post_code: post_code1, num_chairs: 101, category: 'ls1 large')
		cafe4 = create(:street_cafe, name: 'Coffee Cafe', post_code: post_code1, num_chairs: 100, category: 'ls1 large')
		cafe5 = create(:street_cafe, name: 'Average Restaurant', post_code: post_code2, num_chairs: 50, category: 'ls2 large')
		cafe6 = create(:street_cafe, name: 'The Diner', post_code: post_code2, num_chairs: 45, category: 'ls2 large')
		cafe7 = create(:street_cafe, name: 'A Bar', post_code: post_code2, num_chairs: 44, category: 'ls2 small')
		cafe8 = create(:street_cafe, name: 'Dessert Desert', post_code: post_code2, num_chairs: 43, category: 'ls2 small')
		cafe9 = create(:street_cafe, name: 'Place to Eat', post_code: post_code2, num_chairs: 42, category: 'ls2 small')
		cafe10 = create(:street_cafe, name: 'Dirty Diner', post_code: post_code3, num_chairs: 32, category: 'other')

		visit root_path

		click_button 'Reorganize Cafe Data'

		cafe1.reload
		cafe3.reload
		cafe4.reload
		cafe5.reload
		cafe6.reload
		cafe10.reload
		
		expect(cafe1.name).to eq('ls1 medium-Cool Cafe')
		expect { cafe2.reload }.to raise_exception(ActiveRecord::RecordNotFound)
		expect(cafe3.name).to eq('ls1 large-Scary Place')
		expect(cafe4.name).to eq('ls1 large-Coffee Cafe')
		expect(cafe5.name).to eq('ls2 large-Average Restaurant')
		expect(cafe6.name).to eq('ls2 large-The Diner')
		expect { cafe7.reload }.to raise_exception(ActiveRecord::RecordNotFound)
		expect { cafe8.reload }.to raise_exception(ActiveRecord::RecordNotFound)
		expect { cafe9.reload }.to raise_exception(ActiveRecord::RecordNotFound)
		expect(cafe10.name).to eq('Dirty Diner')
	end
end