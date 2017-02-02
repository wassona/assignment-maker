class CourseAssignment < ApplicationRecord
	belongs_to :assignment
	belongs_to :course
end