class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
    	t.string :name
    end
  end
end
