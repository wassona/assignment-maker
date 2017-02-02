class Course < ApplicationRecord
	belongs_to :instructor, class_name: 'User', foreign_key: 'instructor_id'

	has_many :course_students, foreign_key: 'student_id'
	has_many :students, through: :course_students, source: :student

	has_many :course_assignments
	has_many :assignments, through: :course_assignments
end