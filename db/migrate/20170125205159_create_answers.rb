class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
    	t.integer :assignment_id
    	t.string :submission
    	t.string :student_name
    end
  end
end
