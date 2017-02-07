class HomeController < ApplicationController
	def index
		@assignment = Assignment.new
		@user = current_user
		@teacherPanel = current_user.panelFocus 'teacher'
		@studentPanel = current_user.panelFocus 'student'
		@accountPanel = current_user.panelFocus 'account'
	end






end