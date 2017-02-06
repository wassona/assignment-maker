class AssignmentsController < ApplicationController
	before_action :set_assignment, only: [:show, :edit, :update, :destroy, :remote_destroy]


	def index
		@assignment = Assignment.new
		@assignments = current_user.assignments
	end

	def new
		@assignment = Assignment.new
		@user = current_user
	end

	def create
		@assignment = current_user.assignments.new(assignment_params)
		if @assignment.save!
			render :edit, notice: "Assignment created!"
		else
			render "/home/index"
		end
	end

	def edit

	end

	def remote_destroy
		if current_user == @assignment.instructor
			@assignment.destroy
		else
			redirect_to root_path, alert: "You do not have permission to delete that assignment."
		end
	end


	def destroy
		if current_user == @assignment.instructor
			@assignment.destroy
			redirect_to root_path, notice: "Assignment deleted"
		else
			redirect_to root_path, alert: "You do not have permission to delete that assignment."
		end
	end

	def take
		@assignment = Assignment.find params[:id]

		if @assignment.alreadyAnswered? current_user
			redirect_to root_path, alert: "You have already completed that assignment."
		end
	end

	def show
		@assignment = Assignment.find params[:id]
		@courses = @assignment.courses

		if @assignment.answers != []
			@check_id = @assignment.answers.first.user.id
		end
	end


	def update
		@assignment = Assignment.find params[:id]

		if current_user == @assignment.instructor && @assignment.update(assignment_params)
			redirect_to @assignment, notice: "Assignment created!"
		else
			render @assignment
		end
	end


	def enter_answers
		@assignment = Assignment.find params[:id]

		@assignment.createSubmissions answer_params, params[:name], current_user

		redirect_to root_path

	end


	private
		def assignment_params
			params.require(:assignment).permit(:name, :image, :label_data)
		end

		def answer_params
			params.require(:answers).permit!
		end

		def set_assignment
	      @assignment = Assignment.find(params[:id])
	    end
end