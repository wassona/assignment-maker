class Course < ApplicationRecord
	belongs_to :instructor, class_name: 'User', foreign_key: 'instructor_id'


	has_and_belongs_to_many :students, -> { distinct }, class_name: 'User', join_table: 'course_students'

	has_and_belongs_to_many :assignments, join_table: 'course_assignments'

	scope :with_student, -> (student) do
		joins(:students).where("course_students.user_id = ?", student.id)
	end

end