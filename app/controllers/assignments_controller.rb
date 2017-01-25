class AssignmentsController < ApplicationController

	def create
		@assignment = Assignment.new(assignment_params)
		if @assignment.save!
			puts
			puts "success!"
			puts
			render :edit, notice: "Assignment created!"
		else
			puts
			puts "failure"
			puts
			render "home/index"
		end
	end

	def edit
	end

	def show
		@assignment = Assignment.find params[:id]
		@result = "string"
	end


	def update
		@assignment = Assignment.find params[:id]

		if @assignment.update(assignment_params)
			redirect_to @assignment, notice: "Assignment created!"
		else
			render @assignment
		end
	end


	def enter_answers

	end


	private
		def assignment_params
			params.require(:assignment).permit(:name, :image, :label_data)
		end

		def answer_params
			params.require(:answers).permit!
		end
end