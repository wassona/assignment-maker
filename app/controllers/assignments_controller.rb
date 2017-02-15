class AssignmentsController < ApplicationController
	before_action :authenticate_user!, except: [:take, :enter_answers]
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
			render :new
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
		if user_signed_in?
			if @assignment.alreadyAnswered? current_user
				redirect_to request.referer || root_path, alert: "You have already completed that assignment."
			end
		else
			@audit = true
		end
	end

	def show
		@courses = @assignment.courses



		if @assignment.answers != []
			@check_id = @assignment.answers.first.user.id
			@audit_answers = @assignment.auditAnswers
			puts "auditAnswers puts"
			puts @assignment.auditAnswers
			puts
		end
	end


	def update
		@assignment = Assignment.find params[:id]

		if current_user == @assignment.instructor && @assignment.update(assignment_params)
			redirect_to root_path, notice: "Assignment updated!"
		else
			render @assignment
		end
	end


	def enter_answers
		@assignment = Assignment.find params[:id]

		if user_signed_in?
			@assignment.createSubmissions answer_params, current_user.username, current_user
			redirect_to root_path

		else
			@assignment.createSubmissions answer_params, params[:name], @assignment.instructor
			redirect_to root_path

		end


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