class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :courses_taught, class_name: 'Course', foreign_key: 'instructor_id'
  has_many :course_students, foreign_key: 'course_id'
  has_many :courses_taken, through: :course_students, source: :student
  has_many :answers


  has_many :assignments
  
end
