class AssignmentsController < ApplicationController

	def create
		@assignment = Assignment.new(assignment_params)
		if @assignment.save!
			puts
			puts "success!"
			puts
			redirect_to root_path, notice: "Assignment created!"
		else
			puts
			puts "failure"
			puts
			render "home/index"
		end
	end


	private
		def assignment_params
			params.require(:assignment).permit(:name, :image)
		end
end