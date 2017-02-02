class HomeController < ApplicationController
	def index
		@assignment = Assignment.new
		@user = current_user
	end






end