require 'rails_helper'

describe PostCode do
	it 'exists' do
		code_data = 'LS1 5EL'
		create_list(:street_cafe, 3, post_code: code_data, num_chairs: 25)

		post_code = PostCode.new(code_data)

		expect(post_code).to be_a(PostCode)
		expect(post_code.code).to eq('LS1 5EL')
		expect(post_code.total_places).to eq(3)
		expect(post_code.total_chairs).to eq(75)
	end

	describe 'instance methods' do
		it '#chairs_pct' do
			code_data1 = 'LS1 5EL'
			code_data2 = 'LS2 3GL'
			create_list(:street_cafe, 3, post_code: code_data1, num_chairs: 25)
			create_list(:street_cafe, 3, post_code: code_data2, num_chairs: 20)

			post_code1 = PostCode.new(code_data1)
			post_code2 = PostCode.new(code_data2)

			expect(post_code1.chairs_pct.round(2)).to eq(55.56)
			expect(post_code2.chairs_pct.round(2)).to eq(44.44)
		end

		it '#place_with_max_chairs' do
			code_data = 'LS1 5EL'
			cafe1 = create(:street_cafe, post_code: code_data, num_chairs: 20)
			cafe2 = create(:street_cafe, post_code: code_data, num_chairs: 5)
			cafe3 = create(:street_cafe, post_code: code_data, num_chairs: 100)

			post_code = PostCode.new(code_data)

			expect(post_code.place_with_max_chairs).to eq(cafe3.name)
		end
	end
end