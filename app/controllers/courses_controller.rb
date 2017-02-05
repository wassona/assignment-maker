class CoursesController < ApplicationController
	before_action :set_course, only: [:show, :edit, :update, :destroy, :course_student, :remove_student]

	def index
		@course = Course.new
	end

	def new
		@course = Course.new
	end

	def create
		@course = current_user.courses_taught.new course_params

		if @course.save
			redirect_to @course, notice: "Course created!"
		else
			redirect_to request.referer || root_path, alert: "The course could not be created. Please try again."
		end
	end

	def destroy
		if current_user == @course.instructor
			@course.destroy
			redirect_to courses_path, notice: "Course deleted."
		else
			redirect_to courses_path, alert: "You do not have permission to delete that course."
		end
	end

	def show
		@show = "is-active"
		if current_user == @course.instructor
			@isCourseInstructor = true
		end
		

	end

	def edit
		@edit = "is-active"
		if current_user == @course.instructor
			@isCourseInstructor = true
		end
		render :show
	end

	def update
		@course.assignments.destroy_all
		assignmentsUpdate = JSON.parse params[:course][:assignments]
		assignmentsUpdate.each do |id|
			@course.assignments << Assignment.find(id)
		end
	end

	def add_students
		puts 1
		student = User.find(params[:student_id])
		puts 2
		params[:courses].each do |i|
			puts i
			student.courses_taken << Course.find(i)
		end

	end

	def course_student
		@student = User.find params[:student_id]
	end

	def remove_student
		if current_user == @course.instructor
			@course.students.destroy(User.find params[:student_id])
		end
	end

	private

	    def set_course
	      @course = Course.find(params[:id])
	    end


	    def course_params
	      params.require(:course).permit(:name)
	    end

end