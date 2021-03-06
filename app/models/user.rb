class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :courses_taught, class_name: 'Course', foreign_key: 'instructor_id'
  has_and_belongs_to_many :courses_taken, -> { distinct }, class_name: 'Course', join_table: 'course_students'
  has_many :answers


  has_many :assignments

  def panelFocus panel
  	if self.is_teacher && panel == 'teacher'
  		'is-active'
  	elsif !self.is_teacher && self.is_student && panel == 'student'
  		'is-active'
  	elsif !self.is_teacher && !self.is_student && panel == 'account'
  		'is-active'
  	end
  end
  
end
