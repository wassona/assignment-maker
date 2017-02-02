class AssignmentsController < ApplicationController

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
		@assignment = Assignment.find params[:id]
	end

	def destroy
		@assignment = Assignment.find params[:id]
		if current_user == @assignment.instructor
			@assignment.destroy
			redirect_to root_path, notice: "Assignment deleted"
		else
			redirect_to root_path, alert: "You do not have permission to delete that assignment."
		end
	end

	def take
		@assignment = Assignment.find params[:id]

		if current_user != @assignment.instructor
			redirect_to root_path, alert: "You do not have access to that assignment."
		end
	end

	def show
		@assignment = Assignment.find params[:id]
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
end