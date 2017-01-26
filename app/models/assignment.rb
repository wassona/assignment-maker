class Assignment < ApplicationRecord
	has_attached_file :image, styles: { regular: ['100000x100000>', :png]}, 
		convert_options: { regular: "-density 96 -depth 8 -quality 85" }


	validates_attachment :image, content_type: { content_type: ["image/png", "application/pdf"] }


	has_many :answers

	def createSubmissions hash, student_name
		hash.each do |a|
			self.answers.create submission: hash[a], student_name: student_name
		end
	end





end