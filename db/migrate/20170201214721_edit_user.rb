class EditUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :username, :string
  	add_column :users, :is_student, :boolean
  	add_column :users, :is_teacher, :boolean
  end
end
