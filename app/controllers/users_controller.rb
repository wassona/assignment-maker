class UsersController < ApplicationController

	def index
		@students = User.all.where is_student: true
		@teachers = User.all.where is_teacher: true
		@showTeachers = params[:showTeachers]
		@showStudents = params[:showStudents]

	end

	def show
		@user = User.find params[:id]
	end

	

end