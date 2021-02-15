class StreetCafe < ApplicationRecord
	self.table_name = 'street_cafes'

	validates_presence_of :name
	validates_presence_of :address
	validates_presence_of :post_code
	validates_presence_of :num_chairs
end
