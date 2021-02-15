class PostCodeDataController < ApplicationController
	def index
		@post_codes = StreetCafe.post_code_data
	end
end