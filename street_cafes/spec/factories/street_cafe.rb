FactoryBot.define do
	factory :street_cafe do
		name { Faker::Restaurant.name }
		address { Faker::Address.street_address }
		post_code { Faker::Address.zip }
		num_chairs { Faker::Number.between(from: 4, to: 152) }
	end
end