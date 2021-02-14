require 'rails_helper'

describe StreetCafe, type: :model do
	describe 'validations' do
		it { should validate_presence_of :name }
		it { should validate_presence_of :address }
		it { should validate_presence_of :post_code }
		it { should validate_presence_of :num_chairs }
	end
end