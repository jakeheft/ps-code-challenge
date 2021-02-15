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
end