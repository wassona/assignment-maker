class HomeController < ApplicationController
	def index
		@assignment = Assignment.new
	end





	private
		def assignment_params
			params.require(:assignment).permit(:name, :avatar, :image_file_name, :image_content_type, :image_file_size, :image_update_at)
		end
end