class FixCourseStudents < ActiveRecord::Migration[5.0]
  def change
  	remove_column :course_students, :student_id
  	add_column :course_students, :user_id, :integer
  end
end
