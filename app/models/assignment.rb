class Assignment < ApplicationRecord
	has_attached_file :image, styles: { regular: ['100000x100000>', :png]}, 
		source_file_options: { regular: "-density 96 -depth 8 -quality 85" },
		convert_options: { regular: "-posterize 3"}


	validates_attachment :image, content_type: { content_type: ["image/png", "application/pdf"] }


	has_many :answers
	belongs_to :instructor, class_name: 'User', foreign_key: 'user_id'
	has_and_belongs_to_many :courses, join_table: 'course_assignments'
	has_many :students, -> { distinct }, through: :answers, source: :user 

	def createSubmissions hash, student_name, user
		hash.each do |a|
			self.answers.create(
					submission: hash[a], 
					student_name: student_name, 
					user_id: user.id
				)
		end
	end

	def auditAnswers
		all = self.answers.where(["user_id = ?", self.instructor.id])
		result = {}
		all.each do |a|
			if !result[a.student_name]
				result[a.student_name] = []
			end
			result[a.student_name].push a
		end
		result
	end

	def alreadyAnswered? user
		if user.answers.find_by assignment_id: self.id
			true
		end
	end





end