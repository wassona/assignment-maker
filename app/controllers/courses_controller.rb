class CoursesController < ApplicationController
	before_action :set_course, only: [:show, :edit, :update, :destroy]

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
		

	end

	def edit
	end


	private

	    def set_course
	      @course = Course.find(params[:id])
	    end


	    def course_params
	      params.require(:course).permit(:name)
	    end

end