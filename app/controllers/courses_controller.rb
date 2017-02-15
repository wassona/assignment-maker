class CoursesController < ApplicationController
  	before_action :authenticate_user!
	before_action :set_course, only: [:show, :edit, :update, :destroy, :course_student, :remove_student, :enroll, :unenroll]

	def index
		@course = Course.new
		@courses = Course.all
		@instructors = User.all.where( is_instructor: true )
	end

	def new
		@course = Course.new
	end

	def create
		@course = current_user.courses_taught.new course_params

		if @course.save
			redirect_to edit_course_path(@course), notice: "Course created!"
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

		student = User.find(params[:student_id])
		if params[:courses]
			params[:courses].each do |i|
				student.courses_taken << Course.find(i)
			end
		end
	end

	def enroll
		@course.students << current_user
	end

	def unenroll
		@course.students.destroy current_user
	end

	def course_student
		@student = User.find params[:student_id]
		@course = Course.find params[:id]
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