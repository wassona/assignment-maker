class Course < ApplicationRecord
	belongs_to :instructor, class_name: 'User', foreign_key: 'instructor_id'

	# has_many :course_students
	has_and_belongs_to_many :students, class_name: 'User', join_table: 'course_students'

	has_and_belongs_to_many :assignments, join_table: 'course_assignments'
	# has_many :assignments, through: :course_assignments
end