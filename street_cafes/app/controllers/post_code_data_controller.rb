class PostCodeDataController < ApplicationController
	def index
		post_codes = StreetCafe.distinct.pluck(:post_code)
		@post_codes = post_codes.map { |code| PostCode.new(code) }
	end
end