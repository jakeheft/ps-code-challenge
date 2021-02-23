class PostCodeDataController < ApplicationController
	def index
		post_codes = StreetCafe.find_by_sql("SELECT DISTINCT street_cafes.post_code FROM street_cafes")
		post_codes = post_codes.map { |code| code.post_code }
		@post_codes = post_codes.map { |code| PostCode.new(code) }
	end
end