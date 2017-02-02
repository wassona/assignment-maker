class UpdateSchema < ActiveRecord::Migration[5.0]
  def change
  	add_column :answers, :user_id, :integer
  	add_column :assignments, :user_id, :integer
  	create_table :courses do |t|
  		t.string :name
  		t.integer :instructor_id
  	end
  	create_table :course_students do |t|
  		t.integer :course_id
  		t.integer :student_id
  	end
  	create_table :course_assignments do |t|
  		t.integer :course_id
  		t.integer :assignment_id
  	end
  end
end
